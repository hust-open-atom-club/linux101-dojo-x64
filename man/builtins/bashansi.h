#ifndef _BASHANSI_H_
#define _BASHANSI_H_

#if defined (__STDC__)
#  define PROTOTYPES 1
#endif

#if defined (PROTOTYPES)
#  define P(args) args
#else
#  define P(args) ()
#endif

#endif /* _BASHANSI_H_ */
