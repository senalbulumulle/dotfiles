########################################################
#	  Revert Git Commits
########################################################  
function undo-change
        git reset --hard HEAD~1
end

function confirm-undo-change
        git push origin -f 
end


########################################################
#	  Git Shortcuts
########################################################  

function push
        git push origin
end

function pull
        git pull
end

function clone
        git clone
end

function message
        git commit -m 
end   
