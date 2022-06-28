# ********************************************************************* #
#          .-.                                                          #
#    __   /   \   __                                                    #
#   (  `'.\   /.'`  )   FT_Containers - Makefile                        #
#    '-._.(;;;)._.-'                                                    #
#    .-'  ,`"`,  '-.                                                    #
#   (__.-'/   \'-.__)   BY: Rosie (https://github.com/BlankRose)        #
#       //\   /         Last Updated: Tue Jun 28 18:55:36 CEST 2022     #
#      ||  '-'                                                          #
# ********************************************************************* #

#==--------------------------------------==#
# *                                      * #
#             GLOBAL SETTINGS              #
# *                                      * #
#==--------------------------------------==#

# Executable specialities
NAME = 
LANG = cpp
DEFINES = 
TEST_ARGS = 

# Compilation options
COMPILER = c++
FLAGS = -Wall -Werror -Wextra -g3
ifneq ($(OS), Windows_NT)
	DANGER = -fsanitize=address
endif
LIBRARIES = 

# Messages to display
COMPILE_MSG = ƒ Compiling $@ ...
SUCCESS_MSG = √ The programm $(NAME) has been compiled successfully!
CLEANING_MSG = ƒ Cleaning files ...
CLEANOBJ_MSG = ø Objects has been cleared!

#==--------------------------------------==#
# *                                      * #
#             LISTING SOURCES              #
# *                                      * #
#==--------------------------------------==#

# Listing every source files
ALL = 
SUBFOLDER =

# Adds the applicable extension and path to each files
SRC = $(addprefix $(SUBFOLDER), $(addsuffix .$(LANG), $(ALL)))
OBJ = $(SRC:.$(LANG)=.o)

#==--------------------------------------==#
# *                                      * #
#               QUICK MACROS               #
# *                                      * #
#==--------------------------------------==#

# Quick control
SILENT = > /dev/null 2>&1
NOERR = || true
STOP = && false

# Syntax colors
RED = \033[0;31m
GRN = \033[0;32m
YLW = \033[0;33m
BLU = \033[0;34m
NUL = \033[0m
END = \033[0m\n
BACK = \033[2K\r

# Compiler counter
CMP_TOTAL = $(shell awk -F' ' '{printf NF}' <<< "$(SRC)")
CMP_COUNT = 0

#==--------------------------------------==#
# *                                      * #
#              RULES - COMMON              #
# *                                      * #
#==--------------------------------------==#

# Main call upon 'make'
all: $(NAME)

# Clears and recompile the whole project
re: fclean all

# Compile and run the executable and clears
ifeq ($(NAME), test)
tester: all
else # Prevents override issue due to commonly choosen name
test: all
endif
	@./$(NAME) $(TEST_ARGS) $(NOERR)
	@make fclean

# Protection
.PHONY: all re clean fclean re

#==--------------------------------------==#
# *                                      * #
#             RULES - LINUX OS             #
# *                                      * #
#==--------------------------------------==#

# Checks if its NOT Windows
ifneq ($(OS), Windows_NT)

# Compile the sources into object files
.$(LANG).o:
	@printf "$(BACK)$(YLW)[$(CMP_COUNT) / $(CMP_TOTAL)] $(COMPILE_MSG)$(NUL)"
	@$(COMPILER) $(FLAGS) -o $@ -c $<
	@$(eval CMP_COUNT = $(shell expr $(CMP_COUNT) + 1))

# Compile the objects and dependencies into an executable
$(NAME): $(OBJ)
	@printf "$(BACK)$(YLW)[Finalizing..] $(COMPILE_MSG)$(NUL)"
	@$(COMPILER) $(LIBRARIES) $(DANGER) -o $(NAME) $(OBJ)
	@printf "$(BACK)$(GRN)$(SUCCESS_MSG)$(END)"

# Clears all objects files
clean:
	@printf "$(BACK)$(YLW)$(CLEANING_MSG)$(NUL)"
	@rm -f $(OBJ)
	@printf "$(BACK)$(RED)$(CLEANOBJ_MSG)$(END)"

# Clears all objects files, INCLUDING the executable
fclean: clean
	@rm -f $(NAME)

#==--------------------------------------==#
# *                                      * #
#            RULES - WINDOWS OS            #
# *                                      * #
#==--------------------------------------==#

# In case its running under Windows
else

# Compile the sources into object files
.$(LANG).o:
	@echo $(COMPILE_MSG)
	@$(COMPILER) $(FLAGS) -o $@ -c $<
	@$(eval CMP_COUNT = $(shell expr $(CMP_COUNT) + 1))

# Compile the objects and dependencies into an executable
$(NAME): $(OBJ)
	@echo $(COMPILE_MSG)
	@$(COMPILER) $(LIBRARIES) $(DANGER) -o $(NAME) $(OBJ) $(MLX) 
	@echo $(SUCCESS_MSG)

# Clears all objects files
clean:
	@echo $(CLEANING_MSG)
	@del /F /Q $(subst /,\,$(OBJ))
	@echo $(CLEANOBJ_MSG)

# Clears all objects files, INCLUDING the executable
fclean: clean
	@del /F /Q $(addsuffix .exe, $(subst /,\,$(NAME)))

endif