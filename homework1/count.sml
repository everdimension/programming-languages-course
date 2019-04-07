fun countOccurrences(haystack: int list, needle: int) =
  if null haystack then
    0
  else
    if needle = hd haystack then
      1 + countOccurrences(tl haystack, needle)
    else
      0 + countOccurrences(tl haystack, needle)
