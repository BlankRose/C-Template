# ********************************************************************* #
#          .-.                                                          #
#    __   /   \   __                                                    #
#   (  `'.\   /.'`  )   C-Template - General.mk                         #
#    '-._.(;;;)._.-'                                                    #
#    .-'  ,`"`,  '-.                                                    #
#   (__.-'/   \'-.__)   BY: Rosie (https://github.com/BlankRose)        #
#       //\   /         Last Updated: Tue Nov 29 15:37:00 CET 2022      #
#      ||  '-'                                                          #
# ********************************************************************* #

ac: allclean
allc: allclean
allclean: libclean fullclean packageclean

tc: trueclean
truec: trueclean
trueclean: allclean dependclean

re: remake
remake: fullclean all

ra: remakeall
remakeall: allclean all

ifneq ($(NAME), run)
r: run
run: all
else
t: test
test: all
endif
	@./$(NAME) $(ARGUMENTS)