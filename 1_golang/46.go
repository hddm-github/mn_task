package main

func permute(nums []int) [][]int {
	var res [][]int
	var dfs func(int)
	dfs = func(start int) {
		if start == len(nums) {
			temp := make([]int, len(nums))
			copy(temp, nums)
			res = append(res, temp)
			return
		}
		for i := start; i < len(nums); i++ {
			nums[start], nums[i] = nums[i], nums[start]
			dfs(start + 1)
			nums[start], nums[i] = nums[i], nums[start]
		}
	}
	dfs(0)
	ch1 := make(chan int, 1)
	ch1 <- 1
	return res

}
