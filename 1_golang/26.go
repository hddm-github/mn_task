package main

func removeDuplicates(nums []int) int {

	for i := 0; i < len(nums); i++ {
		for j := i + 1; j < len(nums); j++ {
			if nums[i] == nums[j] {
				nums = append(nums[:j], nums[j+1:]...)
				j--
			}
		}
	}
	return len(nums)
}
