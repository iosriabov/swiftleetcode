class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var lhs = 0, rhs = nums.count
        while lhs < rhs {
            let mid = (lhs + rhs) / 2
            nums[mid] < target ? (lhs = mid + 1) : (rhs = mid)
        }
        return lhs
    }
}

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {  
        var firstIndex = 0
        var lastIndex = nums.count - 1
        while firstIndex <= lastIndex {
            var midIndex = (firstIndex + lastIndex) / 2
            
            if nums[midIndex] == target { 
                return midIndex 
            } else if nums[midIndex] > target {
                lastIndex = midIndex - 1
            } else {
                firstIndex = midIndex + 1
            }
        }
        return firstIndex
    }
}
