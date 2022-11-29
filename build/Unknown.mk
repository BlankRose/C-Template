# ********************************************************************* #
#          .-.                                                          #
#    __   /   \   __                                                    #
#   (  `'.\   /.'`  )   C-Template - Unknown.mk                         #
#    '-._.(;;;)._.-'                                                    #
#    .-'  ,`"`,  '-.                                                    #
#   (__.-'/   \'-.__)   BY: Rosie (https://github.com/BlankRose)        #
#       //\   /         Last Updated: Tue Nov 29 15:31:24 CET 2022      #
#      ||  '-'                                                          #
# ********************************************************************* #

#####   RUINS   #####
# Old artifact used for making loading bars
# Its left as a remain in case I want to reimplement them better..

CMP_WORK_CT	= $(MSG_WORK) [$(CMP_COUNT) / $(CMP_TOTAL)] Compiling $@ ... $(MSG_NRET)
CMP_TOTAL	= $(shell awk -F' ' '{printf NF}' <<< "$(SRC)")
CMP_COUNT	= 0

#	@$(CMD_PRINT) $(CMP_WORK_CT) $(SILENT_TS)
#	@$(eval CMP_COUNT = $(shell expr $(CMP_COUNT) + 1))
