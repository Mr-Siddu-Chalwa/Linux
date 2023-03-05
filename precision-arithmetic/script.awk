#!/usr/bin/awk -f

# Print the sum of the numbers in each line
{
    sum = 0
    for (i = 1; i <= NF; i++) {
        if ($i ~ /^[0-9]+$/) {
            sum += $i
        }
    }
    print sum
}

