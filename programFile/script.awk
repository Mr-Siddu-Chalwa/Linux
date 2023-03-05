#!/usr/bin/awk -f

BEGIN {
    FS=" "    # Set the field separator to tab
    print "Name\tOccupation"    # Print column headers
}

NR>1 {    # Ignore the first row
    if ($2 > 30) {    # If the person's age is greater than 30
        print $1"\t"$3    # Print their name and occupation
    }
}
