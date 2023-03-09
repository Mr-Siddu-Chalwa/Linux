BEGIN {
	FS=","
}
{
	if (and($2 > 30, $3 == "Female")) 
		print $1
}
