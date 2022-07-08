/* ********************************************************************* */
/*          .-.                                                          */
/*    __   /   \   __                                                    */
/*   (  `'.\   /.'`  )   FT_Containers - header.hpp                      */
/*    '-._.(;;;)._.-'                                                    */
/*    .-'  ,`"`,  '-.                                                    */
/*   (__.-'/   \'-.__)   BY: Rosie (https://github.com/BlankRose)        */
/*       //\   /         Last Updated: Tue Jun 28 18:57:00 CEST 2022     */
/*      ||  '-'                                                          */
/* ********************************************************************* */

#ifndef __COMMON_H__
# define __COMMON_H__

// Includes of most
// commonly used headers

#ifndef __cplusplus
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