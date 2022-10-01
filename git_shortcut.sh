#!/bin/bash
echo "git pull: LECI_3Y (Press Enter) or ALL-FILES (Press 1)"
read option

# ALL-FILES
if [ $((option)) == 1 ]; then
    git checkout master
    git pull
    sleep 1

    git checkout teste
    git pull
    sleep 1
fi

# Only LECI_3Y OR ALL_FILES
git checkout test2
git pull

