BEGIN {
	myarray[1] = "apple"
	myarray[2] = "banana"
	mystring = "hello world"

	print isarray(myarray)   # Output: 1 (true)
	print isarray(mystring)  # Output: 0 (false)
}
