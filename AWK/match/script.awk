{
    match($0, /(test) (string)/, a)
    print $0
    print "starting position: "RSTART
    print "length of the matched substring: "RLENGTH
}