BEGIN {
    fruit["banana"] = 3
    fruit["apple"] = 5
    fruit["orange"] = 2
    
    # Sort the fruit array by its indices
    asorti(fruit, sorted_fruit)
    
    print "Sorted fruits array in ascending order:"
    # Print the sorted array
    for (i in sorted_fruit) {
        print sorted_fruit[i], fruit[sorted_fruit[i]]
    }

    # Sort the fruit array by its indices in descending
    asorti(fruit, sorted_fruit, PROCINFO["sorted_in"] = "@val_type_desc")
    
    # Print the sorted array in descending
    print "Sorted fruits array in descending order:"
    for (i in sorted_fruit) {
        print sorted_fruit[i], fruit[sorted_fruit[i]]
    }
}