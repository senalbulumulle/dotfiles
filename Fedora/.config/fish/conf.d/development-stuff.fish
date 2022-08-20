########################################################
#	  Development-Stuff
########################################################  


function run-php
## Source: 
## Modified from this source: 
## https://stackoverflow.com/questions/16407530/how-to-get-user-confirmation-in-fish-shell

         while true
                read -l -P '''
                        ####################################################################
                        #                       PHP
                        ####################################################################
                        #
                        #
                        #
                        #      Directions: 
                        #                       After you selected the option that you
                        #                       prefer, php will run. Press ^C to go 
                        #                       back to the menu
                        ####################################################################
                        Which One? 

                        a) php -S localhost:3000
                        b) php -S 127.0.0.1:3000
                        c) php -S localhost:4000
                        d) php -S 127.0.0.1:4000
                        e) Exit the Prompt 

                ''' confirm

            switch $confirm
                        case a
                                clear
                                php -S localhost:3000

                        case b
                                clear
                                php -S 127.0.0.1:3000

                        case c
                                clear
                                php -S localhost:4000

                        case d
                                clear
                                php -S 127.0.0.1:4000

                        case e
                                clear
                                return 0
                end
          end
end

