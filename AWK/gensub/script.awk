BEGIN {
    str = "foo foo bar foo"
    
    # Replace all occurrences of "foo" with "bar"
    new_str = gensub(/foo/, "bar", "g", str)
    
    print new_str  # Output: "bar bar bar bar"
}