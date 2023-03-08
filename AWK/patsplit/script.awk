BEGIN	{
    patsplit("camelCasedExample", words, /(^|[[:upper:]])[[:lower:]]+/)
    for( i in words ) print words[i]
}