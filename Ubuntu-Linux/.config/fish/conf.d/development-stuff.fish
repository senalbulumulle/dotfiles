########################################################
#	  Development-Stuff
########################################################  




########################################################
#	  Options for PHP
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







########################################################
#	  Generates boilerplates
########################################################  


function boilerplates
## Source: 
## Modified from this source: 
## https://stackoverflow.com/questions/16407530/how-to-get-user-confirmation-in-fish-shell

         while true
                read -l -P '''
                        ####################################################################
                        #                       GENERATING A BOILERPLATE?
                        ###################################################################
                        
                        Which One? 

                        a) Generate C
                        b) Generate Python
                        c) Generate Java
                        d) Generate HTML
                        e) Generate README.md 
                        f) Exit the Prompt 

                ''' confirm

            switch $confirm
                        case a
                                clear
                                sh /home/$USER/.config/fish/conf.d/c.sh
                                notify-send "Generated Boilerplate: [C]"
                                micro main.c
                                return 0

                        case b
                                clear
                                sh /home/$USER/.config/fish/conf.d/python.sh
                                notify-send "Generated Boilerplate: [PYTHON]"
                                micro main.py
                                return 0

                        case c
                                clear
                                sh /home/$USER/.config/fish/conf.d/java.sh
                                notify-send "Generated Boilerplate: [JAVA]"
                                micro main.java
                                return 0

                        case d
                                clear
                                sh /home/$USER/.config/fish/conf.d/html.sh
                                notify-send "Generated Boilerplate: [HTML]"
                                micro main.html
                                return 0


                        case e
                                clear
                                sh /home/$USER/.config/fish/conf.d/readme-md.sh
                                notify-send "Generated Boilerplate: [README.md]"
                                micro README.md
                                return 0

                        case f
                                clear
                                return 0
                end
          end
end

