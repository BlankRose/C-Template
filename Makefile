# ********************************************************************* #
#          .-.                                                          #
#    __   /   \   __                                                    #
#   (  `'.\   /.'`  )   C-Template - Makefile                           #
#    '-._.(;;;)._.-'                                                    #
#    .-'  ,`"`,  '-.                                                    #
#   (__.-'/   \'-.__)   BY: Rosie (https://github.com/BlankRose)        #
#       //\   /         Last Updated: Tue Sep 27 20:04:23 CEST 2022     #
#      ||  '-'                                                          #
# ********************************************************************* #



#==--------------------------------------==#
# *                                      * #
#             GLOBAL SETTINGS              #
# *                                      * #
#==--------------------------------------==#

# EXECUTABLE
# Defines the executable's name and the arguments for 'make run/test'
# Add .a to the NAME to make a library instead of a programm

NAME			= run.a
ARGUMENTS		= 

# COMPILATION
# Configurations for compilation

LANGUAGE		= cpp
COMPILER		= default
LIB_FILES		= 
LIB_FOLDER		= 
INCLUDES		= 
LINKER_PARAMS	= 
DEFINES			= 
COMPILE_PARAMS	= -Wall -Werror -Wextra -g3
ifneq ($(OS), Windows_NT)
	LINKER_PARAMS += -fsanitize=address
endif

# DEPENDENCIES
# Specify which subfolder to "make" and clone/pull needed repos

EXT_FOLDER		= libs
REQUIERD		= libft
REPOSITORIES	= git@github.com:BlankRose/libft.git
EXT_BINARIES	= 



#==--------------------------------------==#
# *                                      * #
#               SOURCE FILES               #
# *                                      * #
#==--------------------------------------==#

CLASSES_FOLDER	= classes
CLASSES_FILES	= 
CLASSES			= $(addprefix $(CLASSES_FOLDER)$(FOLD), $(CLASSES_FILES))

GENERIC_FILES	= main
GENERIC_FOLDER	= src

# Add additional source files which doesn't
# has the expected extension for set LANGUAGE
SRC				= 



#==--------------------------------------==#
# *                                      * #
#             DISPLAY MESSAGES             #
# *                                      * #
#==--------------------------------------==#

# SYNTAX SEQUENCES
ESC			= 
ifneq ($(OS), Windows_NT)
	NEWLINE	= \n
	QUOTE	= "
	BREAK	= \r
endif
RED			= $(ESC)[0;31m
GRN			= $(ESC)[0;32m
YLW			= $(ESC)[0;33m
BLU			= $(ESC)[0;34m
NUL			= $(ESC)[0m
END			= $(ESC)[0m$(NEWLINE)
BACK		= $(ESC)[2K$(BREAK)

# DISPLAY ICONS
ifneq ($(OS), Windows_NT)
	ICO_PROCESS	= ƒ
	ICO_SUCCESS	= √
	ICO_FAILURE	= ø
endif

# GENERAL COMBINAISONS
MSG_WORK	= $(QUOTE)$(BACK)$(YLW)$(ICO_PROCESS)
MSG_GOOD	= $(QUOTE)$(BACK)$(GRN)$(ICO_SUCCESS)
MSG_ERROR	= $(QUOTE)$(BACK)$(RED)$(ICO_FAILURE)
MSG_WRET	= $(END)$(QUOTE)
MSG_NRET	= $(NUL)$(QUOTE)

# COMPILING MESSAGES
GET_NEEDING	= $(MSG_WORK) Fetching dependencies ...$(MSG_NRET)
CMP_NEEDING	= $(MSG_WORK) Compiling dependencies ...$(MSG_NRET)
CMP_WORKING	= $(MSG_WORK) Compiling $@ ...$(MSG_NRET)
LIB_SUCCESS	= $(MSG_GOOD) The library $(NAME) has been compiled successfully!$(MSG_WRET)
LIB_FAILURE	= $(MSG_ERROR) The library $(NAME) failed to compile!$(MSG_WRET)
CMP_SUCCESS	= $(MSG_GOOD) The programm $(NAME) has been compiled successfully!$(MSG_WRET)
CMP_FAILURE	= $(MSG_ERROR) The programm $(NAME) failed to compile!$(MSG_WRET)

# CLEARING MESSAGES
CLR_NEEDING	= $(MSG_WORK) Cleaning dependencies ...$(MSG_NRET)
CLR_WORKING	= $(MSG_WORK) Cleaning files ...$(MSG_NRET)
CLR_SUCCESS	= $(MSG_GOOD) Objects has been cleared!$(MSG_WRET)
CLR_FAILURE	= $(MSG_ERROR) Objects couldn't be cleared!$(MSG_WRET)

# MISC MESSAGES
NON_COMPAT	= $(MSG_ERROR) This rule is not compatible yet with your OS $(OS)$(MSG_WRET)



#==--------------------------------------==#
# *                                      * #
#              SPECIAL MACROS              #
# *                                      * #
#==--------------------------------------==#

# LANGUAGE CORRECTOR
ifneq (, $(filter CPP CPp Cpp cPP cPp cpP cpp c++ C++, $(LANGUAGE)))
	FILE_EXTENSION := .cpp
else ifneq (, $(filter C c, $(LANGUAGE)))
	FILE_EXTENSION := .c
else
	FILE_EXTENSION := .$(LANGUAGE)
endif

# BASIC MACROS
ifneq ($(GENERIC_FOLDER), )
	SRC		+= $(foreach file, $(GENERIC_FILES), $(GENERIC_FOLDER)$(FOLD)$(file)$(FILE_EXTENSION))
else
	SRC 	+= $(foreach file, $(GENERIC_FILES), $(file)$(FILE_EXTENSION))
endif
OBJ			= $(SRC:$(FILE_EXTENSION)=.o)
LINKS		= $(EXT_BINARIES) $(LINKER_PARAMS)
FLAGS		= $(addprefix -L, $(LIB_FOLDER)) \
			  $(addprefix -l, $(LIB_FILES)) \
			  $(addprefix -I, $(INCLUDES)) \
			  $(addprefix -D, $(DEFINES)) \
			  $(COMPILE_PARAMS)

# SYSTEM CONTROL
ifeq ($(OS), Windows_NT)
	FOLD	= \\
	NOERR	= || exit 0
	SILENT	= > NUL 2>&1
	STOP	= && exit 1
else
	FOLD	= /
	NOERR	= || true
	SILENT	= > /dev/null 2>&1
	STOP	= && false
endif
CONTINUE	= $(SILENT) $(NOERR)

# PRE-GENERATED COMMANDS
ifeq ($(OS), Windows_NT)
	CMD_PRINT	= echo
	CMD_CLEAR	= del /f /q
	ifneq ($(suffix $(NAME)), .a)
		CMD_EXE		= .exe
	endif
	ifneq ($(EXT_FOLDER), )
		GO_EXT		= ((mkdir $(EXT_FOLDER) $(SILENT) && cd $(EXT_FOLDER) $(SILENT)) || cd $(EXT_FOLDER) $(SILENT))
	endif
	GET_REPOS		= $(GO_EXT) $(foreach rep, $(REPOSITORIES), && (git clone $(rep) $(SILENT) || git pull $(r) $(SILENT)) )
	MAKE_REQUIERD	= $(GO_EXT) $(foreach dir, $(REQUIERD), && make -sC $(dir) )
	MAKE_CLEAR		= $(GO_EXT) $(foreach dir, $(REQUIERD), && make fclean -sC $(dir) )

else
	CMD_PRINT	= printf
	CMD_CLEAR	= rm -f
	ifneq ($(EXT_FOLDER), )
		GO_EXT		= mkdir $(EXT_FOLDER) $(SILENT); cd $(EXT_FOLDER) $(SILENT);
	endif
	GET_REPOS		= $(GO_EXT) $(foreach repo, $(REPOSITORIES), git clone $(repo) $(SILENT); )
	MAKE_REQUIERD	= $(GO_EXT) $(foreach folder, $(REQUIERD), make -sC $(folder) $(SILENT); )
	MAKE_CLEAR		= $(GO_EXT) $(foreach folder, $(REQUIERD), make fclean -sC $(folder) $(SILENT); )
endif
CMD_LIB			= ar -rc

# DEFAULT COMPILER SELECTOR
ifeq ($(COMPILER), default)
	ifeq ($(FILE_EXTENSION), .cpp)
		COMPILER = c++
	else ifeq ($(FILE_EXTENSION), .c)
		COMPILER = gcc
	else
		COMPILER = gcc
	endif
endif



#==--------------------------------------==#
# *                                      * #
#              MAKEFILE RULES              #
# *                                      * #
#==--------------------------------------==#

a: all
all: $(NAME)

d: dependencies
dependencies:
ifneq ($(REPOSITORIES), )
	@$(CMD_PRINT) $(GET_NEEDING)
	@$(GET_REPOS)
endif
ifneq ($(REQUIERD), )
	@$(CMD_PRINT) $(CMP_NEEDING)
	@$(MAKE_REQUIERD)
endif

.c.o:
	@$(CMD_PRINT) $(CMP_WORKING)
	@$(COMPILER) $(FLAGS) -o $@ -c $<

.cpp.o:
	@$(CMD_PRINT) $(CMP_WORKING)
	@$(COMPILER) $(FLAGS) -o $@ -c $<

$(NAME): dependencies $(OBJ)
	@$(CMD_PRINT) $(CMP_WORKING)
ifeq ($(suffix $(NAME)), .a)
	@$(CMD_LIB) $(NAME) $(OBJ)
	@$(CMD_PRINT) $(LIB_SUCCESS)
else
	@$(COMPILER) -o $(NAME) $(OBJ) $(LINKS) $(FLAGS)
	@$(CMD_PRINT) $(CMP_SUCCESS)
endif

c: clean
clean:
	@$(CMD_PRINT) $(CLR_WORKING)
	@$(CMD_CLEAR) $(OBJ) $(SILENT)
	@$(CMD_PRINT) $(CLR_SUCCESS)

fc: fclean
fclean: clean
	@$(CMD_CLEAR) $(NAME)$(CMD_EXE)

lc: libclean
libclean:
	@$(CMD_PRINT) $(CLR_NEEDING)
	@$(MAKE_CLEAR)

ifneq ($(NAME), run)
r: run
run: all
else
t: test
test: all
endif
	@./$(NAME) $(ARGUMENTS)

re: remake
remake: fclean all

.PHONY: all dependencies clean fclean libclean remake

# Personnal free to use template
# BY Rosie ~
