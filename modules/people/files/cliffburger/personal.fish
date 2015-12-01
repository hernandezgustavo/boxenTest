alias subl='subl3'
set -x EDITOR 'subl3 -w'
alias mountSrc='hdiutil mount ~/Documents/sourceFolder.sparsebundle/ -mountpoint ~/src'
alias ls='ls -al'
alias startvm2="vmrun -T fusion start \"$VM2_PATH\" nogui"
alias stopvm2="vmrun -T fusion stop \"$VM2_PATH\""
