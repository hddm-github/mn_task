package main

func singleNumber(nums []int) int {
	out := make(map[int]int, len(nums))
	for _, v := range nums {
		out[v] += 1
	}
	for k, v := range out {
		if v == 1 {
			return k
		}
	}
	return 0
}
