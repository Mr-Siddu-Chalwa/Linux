awk --re-interval '$1 ~ /^[5-9][0-9]{1,2}$/ || $1 ~ /^1[0-4][0-9]{0,1}$/ { print }' input.txt
