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

a)  Generate C
b)  Generate Python
b1) Generate Python If-Statements with Bash and OS module
c)  Generate Java
d)  Generate HTML
e)  Generate README.md 
f)  Generate GitHub Actions YAML File
g)  Generate Vala 
g1) Generate Vala (Functions)
g2) Generate Vala (Reading User Input)
h) Exit


                ''' confirm

            switch $confirm

                        ## If the user selects this, it will allow the system 
                        ## to generate a main.c file
                        case a
                                clear
                                sh /home/$USER/.config/fish/conf.d/c.sh
                                notify-send "Generated Boilerplate: [C]"
                                micro main.c
                                return 0


                        ## If the user selects this, it will allow the system 
                        ## to generate a main.py file
                        case b
                                clear
                                sh /home/$USER/.config/fish/conf.d/python.sh
                                notify-send "Generated Boilerplate: [PYTHON]"
                                micro main.py
                                return 0



                        ## If the user selects this, it will allow the system 
                        ## to generate a main.py file with an example of 
                        ## an if statement with os module with bash. 
                        case b1
                                clear
                                sh /home/$USER/.config/fish/conf.d/python-with-if-statement-with-os-module-with-bash.sh
                                notify-send "Generated Boilerplate: [PYTHON]"
                                micro main.py
                                return 0


                        ## If the user selects this, it will allow the system 
                        ## to generate a main.java file                        
                        case c
                                clear
                                sh /home/$USER/.config/fish/conf.d/java.sh
                                notify-send "Generated Boilerplate: [JAVA]"
                                micro main.java
                                return 0



                        ## TODO: MAKE EXAMPLES AS BOILERPLATES FOR JAVA


                        ## If the user selects this, it will allow the system 
                        ## to generate a main.html file
                        case d
                                clear
                                sh /home/$USER/.config/fish/conf.d/html.sh
                                notify-send "Generated Boilerplate: [HTML]"
                                micro main.html
                                return 0


                        ## If the user selects this, it will allow the system
                        ## to generate a README.md file
                        case e
                                clear
                                sh /home/$USER/.config/fish/conf.d/readme-md.sh
                                notify-send "Generated Boilerplate: [README.md]"
                                micro README.md
                                return 0





                        ## If the user selects this, it will allow the system 
                        ## to generate a Github Workflow
                        case f
                                mkdir .github
                                cd .github
                                mkdir workflows
                                cd workflows
                                touch blank.yml
                                echo """
## File generated by Senal's dotfiles

# This is a basic workflow to help you get started with Actions

name: CI

# Controls when the workflow will run
on:
  # Triggers the workflow on push or pull request events but only for the "master" branch
  push:
    branches: [ "master" ]
  pull_request:
    branches: [ "master" ]

  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:

# A workflow run is made up of one or more jobs that can run sequentially or in parallel
jobs:
  # This workflow contains a single job called "build"
  build:
    # The type of runner that the job will run on
    runs-on: ubuntu-latest

    # Steps represent a sequence of tasks that will be executed as part of the job
    steps:
      # Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
      - uses: actions/checkout@v3

      # Runs a single command using the runners shell
      - name: Run a one-line script
        run: echo Hello, world!

      # Runs a set of commands using the runners shell
      - name: Run a multi-line script
        run: |
          echo Add other actions to build,
          echo test, and deploy your project.

                                """ >> blank.yml

                                micro blank.yml



                        ## If the user selects this, it will allow the system 
                        ## to generate a main.vala file. Which by default, 
                        case g 
                                clear
                                sh /home/$USER/.config/fish/conf.d/vala-default.sh
                                notify-send "Generated Boilerplate: [Vala]"
                                micro main.vala
                                return 0                                



                        case g1 
                                clear
                                sh /home/$USER/.config/fish/conf.d/vala-1.sh
                                notify-send "Generated Boilerplate: [Vala FUNCTIONS TEMPLATE]"
                                micro main.vala
                                return 0  




                        case g2
                                clear
                                sh /home/$USER/.config/fish/conf.d/vala-2.sh
                                notify-send "Generated Boilerplate: [Vala READING USER INPUT TEMPLATE]"
                                micro main.vala
                                return 0  
                                
                        case h
                                clear
                                return 0
                end
          end
end
