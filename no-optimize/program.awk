#!/usr/bin/awk -f

BEGIN {
    for (i = 1; i <= 1000000; i++) {
        x = sin(i);
        y = cos(i);
        z = sqrt(x*x + y*y);
        print z;
    }
}
