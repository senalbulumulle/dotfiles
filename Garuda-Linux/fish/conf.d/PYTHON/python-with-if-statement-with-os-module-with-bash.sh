        touch main.py && echo """
###############################################################
#		Title: 
#        
#		Author: 
#
# 		Description: 
###############################################################/
import os


def main():

	## This is where you put some of the commands 
	## that you normally put in the terminal 

	## You can put multple variables into this
	## and if you want, change the variable
	## name to any in your preference. 


        variable = os.system('<SOME BASH COMMMANDS>')


	## This is where the if statement comes in

        if variable == 0:
        	## Python action. 
                print('hello world')


        

main()
		
        """ > main.py
