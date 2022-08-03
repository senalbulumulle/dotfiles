if status is-interactive
    # Commands to run in interactive sessions can go here

    ########################################################
    #	  Senal's config.fish Config
    #
    ########################################################
    
    
    
    
    
    
    ########################################################
    #	  Functions to make the workflow easier. 
    #			
    ########################################################
    
    
    
    
    ########################################################
    #	  Turns on or off Hidden Files in Apple macOS
    #	  Finder
    ########################################################
    function mac.hidden.files.on
                defaults write com.apple.finder AppleShowAllFiles YES;
                killall Finder
                echo "/!\ The Hidden Files is turned on. "
    end 

    
    function mac.hidden.files.off
                defaults write com.apple.Finder AppleShowAllFiles NO; 
                killall Finder
                echo "/!\ The Hidden Files is turned off. "
    end