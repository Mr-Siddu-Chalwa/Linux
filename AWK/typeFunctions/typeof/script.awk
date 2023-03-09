BEGIN {
	myint = 42
		myfloat = 3.14
		mystring = "hello world"
		myarray[1] = "apple"
		myarray[2] = "banana"

		print typeof(myint)    # Output: "number"
		print typeof(myfloat)  # Output: "number"
		print typeof(mystring) # Output: "string"
		print typeof(myarray)  # Output: "array"
		print typeof(myvar)    # Output: "undefined"
}
