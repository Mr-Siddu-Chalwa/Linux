function rectange_area(width, height,		area) {
	area = width * height
	return area
}

BEGIN {
	width = 5
	height = 10

	printf("the are of rectange is %d\n", rectange_area(width, height))
}
