BEGIN {FS=", "}
{
    sum += $2
    count++
}
END {
    print "Average age:", sum / count
}
