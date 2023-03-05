#!/usr/bin/awk -f

BEGIN {
    FS=" "   
    print "Name\tOccupation"
}

NR>1 {
    if ($2 > threshold) {
        print $1"\t"$3
    }
}
