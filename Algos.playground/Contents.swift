import UIKit

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for (indx, val) in nums.enumerated() {
            for j in (indx+1)..<nums.count {
                if val + nums[j] == target {
                    return [indx, j]
                }
            }
        }
        return []
    }
    
    func refactorTwoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]() //used to store numbers from the nums array as keys and their corresponding indices as values
        for (indx, val) in nums.enumerated() {
            // current number + complement = target
            print("complement: ", dict[target - val] ?? "nil") // prints complement: 1
            if let indxOfComplimentNumber = dict[target - val] { //target - val: For the current number val, we calculate what number (its "complement") would be needed to reach the target
                return [indx, indxOfComplimentNumber]
            }
            dict[val] = indx
        }
        return []
    }
}

let solution = Solution()
print(solution.refactorTwoSum([2, 7, 11, 15], 22)) // Output: [3, 1]
