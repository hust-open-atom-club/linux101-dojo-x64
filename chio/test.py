#!/usr/bin/env python3

import asteval
import signal
import time
import pwn
import ast
import os

CHAL = os.path.join(os.path.dirname(os.path.realpath(__file__)), "chio.py")

def test_parents():
    # test python
    with open("/tmp/x.py", "w") as o:
        o.write(f"""import subprocess; print(subprocess.check_output("{CHAL} --parent python".split()))\n""")
    with pwn.process("python /tmp/x.py".split()) as p:
        assert b'Success!' in p.readall()

    # test shell
    with pwn.process(f"{CHAL} --parent bash".split()) as p:
        assert b'Success!' not in p.readall()
    with pwn.process(f"echo {CHAL} --parent bash | bash", shell=True) as p:
        assert b'Success!' in p.readall()

    # test shellscript
    with open("/tmp/x.sh", "w") as o:
        o.write(f"""#!/bin/bash\n{CHAL} --parent shellscript""")
    with pwn.process("bash /tmp/x.sh".split()) as p:
        assert b'Success!' in p.readall()

    # test ipython
    with pwn.process(f"""echo 'import subprocess; print(subprocess.check_output("{CHAL} --parent ipython".split()))' | ipython3""", shell=True) as p:
        assert b'Success!' in p.readall()

    with pwn.process(f"{CHAL} --parent ipython".split()) as p:
        assert b'Success!' not in p.readall()

    # test find
    assert b'Success!' in pwn.process(f"""find /mnt -exec {CHAL} --parent find \\;""", shell=True).readall()

    # test binaries
    assert b'Success!' not in pwn.process(f"{CHAL} --parent binary".split()).readall()
    with open("/tmp/asdf.c", "w") as o:
        o.write("""
          #include <unistd.h>
          #include <stdlib.h>
          int pwncollege() { }
          int main(int argc, char **argv) {
            int p = fork();
            if (!p) { execl(getenv("CHAL"), getenv("CHAL"), "--parent", "binary"); }
            else waitpid(p, NULL);
          }
        """)
    pwn.process(f"gcc -o {os.path.expanduser('~')}/asdf /tmp/asdf.c", stdout=1, stderr=2, shell=True).wait()
    assert b'Success!' in pwn.process([f"{os.path.expanduser('~')}/asdf"], env={"CHAL": CHAL}).readall()

def test_redirection():
    # test stdin
    assert b'Success!' not in pwn.process(f"{CHAL} --check_stdin_path /etc/passwd", shell=True).readall()
    with pwn.process(f"{CHAL} --check_stdin_path /etc/passwd".split(), stdin=open("/etc/passwd")) as p:
        assert b'Success!' in p.readuntil("Success!") #readall triggers bizarre pwntools behavior

    # test stdout
    with pwn.process(f"{CHAL} --check_stdout_path /etc/passwd", shell=True) as p:
        assert b'Success!' not in p.readall()
    with pwn.process(f"{CHAL} --check_stdout_path /tmp/out --chio_pass_fd 1".split(), stdout=open("/tmp/out", "wb")) as p:
        p.clean() # readall triggers bizarre pwntools behavior with a kill -9
        p.wait()
    with open("/tmp/out") as f:
        assert 'Success!' in f.read()

    # test stderr
    with pwn.process(f"{CHAL} --check_stderr_path /etc/passwd", shell=True) as p:
        assert b'Success!' not in p.readall()
    with pwn.process(f"{CHAL} --check_stderr_path /tmp/err --chio_pass_fd 1", stderr=open("/tmp/err", "wb"), shell=True) as p:
        assert b'Success!' in p.readuntil("Success!") #readall triggers bizarre pwntools behavior

def test_networking():
    with pwn.process(f"{CHAL} --listen_dup 1337 --client netcat --chio_pass_fd 1", shell=True) as p:
        p.readuntil("TCP port")
        output = pwn.process("nc -vv -w 1 localhost 1337".split()).readall()
        p.readall()
        assert b"Success!" in output

    with pwn.process(f"{CHAL} --listen_dup 1337 --client socat", shell=True) as p:
        p.readuntil("TCP port")
        assert b"Success!" in pwn.process("socat tcp:localhost:1337 stdio", shell=True).readall()

    with pwn.process(f"{CHAL} --listen_dup 1337 --client netcat", shell=True) as p:
        p.readuntil("TCP port")
        assert b"Success!" not in pwn.process("socat tcp:localhost:1337 stdio", shell=True).readall()

    with pwn.process(f"{CHAL} --listen_dup 1337 --client bash", shell=True) as p:
        p.readuntil("TCP port")
        assert b"Success!" in pwn.process("""echo 'exec 3</dev/tcp/localhost/1337; while read -u 3 lol; do echo $lol; done' | bash""", shell=True).readall()

    with pwn.process(f"{CHAL} --listen_dup 1337 --client bash", shell=True) as p:
        p.readuntil("TCP port")
        assert b"Success!" not in pwn.process("""echo 'exec 3</dev/tcp/localhost/1337; while read -u 3 lol; do echo $lol; done' | bash -i""", shell=True).readall()

def test_pipes():
    with pwn.process(f"/bin/cat /etc/passwd - | {CHAL} --check_stdin_pipe cat", shell=True) as p:
        assert b'Success!' in p.readuntil("Success!")

    assert b'Success!' in pwn.process(f"{CHAL} --check_stdout_pipe cat | cat", shell=True).readall()
    assert b'Success!' not in pwn.process(f"{CHAL} --check_stdout_pipe cat", shell=True).readall()
    assert b'Success!' in pwn.process(f"{CHAL} --check_stdout_pipe grep | grep .", shell=True).readall()
    assert b'Success!' in pwn.process(f"{CHAL} --check_stdout_pipe sed | sed -e 's/X/Y/'", shell=True).readall()
    assert b'Success!' in pwn.process(f"{CHAL} --check_stdout_pipe rev --chio_pass_fd 1 | rev", shell=True).readall()[::-1]

    # test shellscript
    with open("/tmp/x.sh", "w") as o:
        o.write("""#!/bin/bash\ncat""")
    assert b'Success!' in pwn.process(f"{CHAL} --check_stdout_pipe shellscript | bash /tmp/x.sh", shell=True).readall()

    # test parent communication
    assert b'Success!' in pwn.process(f"{CHAL} --check_stdout_parent --chio_pass_fd 1".split(), stdout=pwn.PIPE).readuntil("Success!")
    pwn.process(f"{CHAL} --check_stdout_parent".split(), stdout=open("/tmp/fdsa", "w")).wait()
    assert "Success!" not in open("/tmp/fdsa").read()
    assert b'Success!' in pwn.process(f"{CHAL} --check_stdin_parent".split()).readall()
    assert b'Success!' not in pwn.process(f"{CHAL} --check_stdin_parent".split(), stdin=open("/dev/null")).readuntil("FAIL")

def test_env():
    assert b'Success!' not in pwn.process(f"{CHAL} --empty_env", shell=True).readall()
    assert b'Success!' in pwn.process(f"{CHAL} --empty_env", shell=True, env={}).readall()
    assert b'Success!' not in pwn.process(f"{CHAL} --check_env asdf:fdsa", shell=True, env={}).readall()
    assert b'Success!' in pwn.process(f"{CHAL} --check_env asdf:fdsa", shell=True, env={'asdf':'fdsa'}).readall()
    assert b'Success!' in pwn.process(f"{CHAL} --check_env asdf:fdsa --empty_env", shell=True, env={'asdf':'fdsa'}).readall()
    assert b'Success!' not in pwn.process(f"{CHAL} --check_env HOME:{os.environ['HOME']} --empty_env".split()).readall()
    assert b'Success!' in pwn.process(f"{CHAL} --check_env HOME:{os.environ['HOME']}".split()).readall()

def test_arg():
    assert b'Success!' not in pwn.process(f"{CHAL} --check_arg 100:asdf", shell=True).readall()
    assert b'Success!' in pwn.process(f"{CHAL} --check_arg 1:asdf -- fdsa asdf", shell=True).readall()
    assert b'Success!' not in pwn.process(f"{CHAL} --check_arg 1:asdf -- fdsa fdsa", shell=True).readall()
    assert b'Success!' in pwn.process(f"{CHAL} --empty_argv --", shell=True).readall()
    assert b'Success!' not in pwn.process(f"{CHAL} --empty_argv -- /chal", shell=True).readall()

def test_fifo():
    assert b'Success!' not in pwn.process(f"{CHAL} --check_stdin_fifo", shell=True).readall()

    if os.path.exists("/tmp/testfifo"):
        os.unlink("/tmp/testfifo")
    os.mkfifo("/tmp/testfifo", 0o644)

    with pwn.process(f"{CHAL} --check_stdin_fifo </tmp/testfifo", shell=True) as p:
        with open("/tmp/testfifo", "w") as _:
            assert b'Success!' in p.readall()

    with pwn.process(f"{CHAL} --check_stdout_fifo --chio_pass_fd 1 >/tmp/testfifo", shell=True) as p:
        with open("/tmp/testfifo", "r") as f:
            assert 'Success!' in f.read()

def test_cwd():
    assert b'Success!' not in pwn.process(f"{CHAL} --cwd /tmp", shell=True).readall()
    assert b'Success!' in pwn.process(f"{CHAL} --cwd /tmp", cwd='/tmp', shell=True).readall()
    assert b'Success!' not in pwn.process(f"{CHAL} --parent_different_cwd", shell=True).readall()
    assert b'Success!' in pwn.process(f"{CHAL} --parent_different_cwd".split(), cwd="/tmp").readall()


def solve_chals(p, num_challenges):
    for _ in range(num_challenges):
        p.readuntil("solution for: ")
        challenge = p.readline().strip().decode()
        response = asteval.Interpreter()(challenge)
        assert response is not None
        p.sendline(str(response))
        assert b"CORRECT!" in p.readuntil(b"CORRECT!\n").strip()

def test_challenges():
    with pwn.process(f"{CHAL} --num_challenges 10 --challenge_depth 5 --challenge_ops +*&^%|".split()) as p:
        solve_chals(p, 10)
        assert b"Success!" in p.readall()

    with pwn.process(f"{CHAL} --password asdf", shell=True) as p:
        p.sendline(b"asdf")
        assert b"Success!" in p.readall()

    with pwn.process(f"{CHAL} --password asdf --input_dup 1337", shell=True) as p:
        p.sendline(b"asdf")
        assert b"Success!" not in p.readall()

    with open("/tmp/asdf", "w") as o:
        o.write("asdf")
    def open_1337():
        f = os.open("/tmp/asdf", 0)
        os.dup2(f, 137)
    with pwn.process(f"{CHAL} --password asdf --input_dup 137", preexec_fn=open_1337, shell=True) as p:
        p.sendline("asdf")
        assert b"Success!" not in p.readall()

def test_signals():
    with pwn.process(f"{CHAL} --num_signals 10".split()) as p:
        p.readuntil("order: ")
        signal_list = ast.literal_eval(p.readline().strip().decode('latin1'))
        for s in signal_list:
            p.clean()
            time.sleep(0.1)
            os.kill(p.pid, getattr(signal, s))
        assert b"Success!" in p.readall()

    with pwn.process(f"{CHAL} --num_signals 10".split()) as p:
        p.readuntil("order: ")
        signal_list = ast.literal_eval(p.readline().strip().decode('latin1'))[::-1]
        for s in signal_list:
            try:
                os.kill(p.pid, getattr(signal, s))
            except ProcessLookupError:
                break
            p.clean()
        assert b"Success!" not in p.readall()

if __name__ == '__main__':
    test_pipes()
    test_parents()
    test_challenges()
    test_signals()
    test_arg()
    test_cwd()
    test_fifo()
    test_env()
    test_redirection()
    test_networking()

    print("SUCCESS")
