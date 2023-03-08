#!/usr/bin/awk -f

BEGIN { max = 0 }

{ if ($1 > max) max = $1 }

END { print max }
