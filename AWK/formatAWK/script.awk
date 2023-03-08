BEGIN { 
    FS = "," 
    print "Name, Age, Salary" 
}
{ 
    print $1, $2, $3 
}
