#!/usr/bin/awk -f

BEGIN {
    print "Reading input file..."
}

{
    total += $1
    count++
}

END {
    print "Processed", count, "lines."
    print "Total:", total
}
