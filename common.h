/* ********************************************************************* */
/*          .-.                                                          */
/*    __   /   \   __                                                    */
/*   (  `'.\   /.'`  )   FT_Containers - common.h                        */
/*    '-._.(;;;)._.-'                                                    */
/*    .-'  ,`"`,  '-.                                                    */
/*   (__.-'/   \'-.__)   BY: Rosie (https://github.com/BlankRose)        */
/*       //\   /         Last Updated: Sat Jul 16 16:06:33 CEST 2022     */
/*      ||  '-'                                                          */
/* ********************************************************************* */

#ifndef __COMMON_H__
# define __COMMON_H__

// Includes of most
// commonly used headers

#ifdef __cplusplus
// Most used in CPP

# include <algorithm>
# include <iostream>
# include <string>
# include <vector>
# include <map>

#else
// Most used in C

# include <stdlib.h>
# include <stdarg.h>
# include <stdio.h>

# ifdef _WIN32
# include <io.h>
# else
# include <unistd.h>
# endif

#endif
#endif