BEGIN	{
    fruits[3] = "apple"
    fruits[1] = "banana"
    fruits[2] = "cherry"

    # Sort the fruits array by value in ascending order
    asort(fruits, sorted)
    print "Sorted fruits array in ascending order:"
    for ( f in sorted) {
        print f " " sorted[f]
    }

    # Sort the fruits array by value in descending order
    asort(fruits, sorted, PROCINFO["sorted_in"] = "@val_type_desc")
    print "Sorted fruits array in descending order:"
    for ( f in sorted) {
        print f " " sorted[f]
    }
}