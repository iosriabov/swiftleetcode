class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
              return false 
             }

        let string = String(x)

        return string == String(string.reversed())
    }
}

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        var array = Array(String(x))
        var left = 0
        var right = array.count - 1
        
        while left < right {
            if array[left] != array[right] { 
                return false 
            } else { 
                left += 1
                right -= 1 
            }
        }
        return true
    }
}
