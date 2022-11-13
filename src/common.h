/* ********************************************************************* */
/*          .-.                                                          */
/*    __   /   \   __                                                    */
/*   (  `'.\   /.'`  )   C-Template - common.h                           */
/*    '-._.(;;;)._.-'                                                    */
/*    .-'  ,`"`,  '-.                                                    */
/*   (__.-'/   \'-.__)   BY: Rosie (https://github.com/BlankRose)        */
/*       //\   /         Last Updated: Sun Nov 13 16:38:07 CET 2022      */
/*      ||  '-'                                                          */
/* ********************************************************************* */

#ifndef COMMON_H
# define COMMON_H

// Includes of most
// commonly used headers

# ifdef __cplusplus
// Most used in CPP

#  include <algorithm>
#  include <iostream>
#  include <string>
#  include <vector>
#  include <map>

# else
// Most used in C

#  include <stdlib.h>
#  include <stdarg.h>
#  include <stdio.h>

#  ifdef _WIN32
#   include <io.h>
#  else
#   include <unistd.h>
#  endif

# endif /* __cplusplus */
#endif /* COMMON_H */