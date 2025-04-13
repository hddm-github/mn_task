package main

func reverseString(s []byte) {
	lens := len(s)
	for i := 0; i < lens/2; i++ {
		s[i], s[lens-i-1] = s[lens-i-1], s[i]
	}
}
