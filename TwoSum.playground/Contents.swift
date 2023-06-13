import UIKit

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        //let numbers = Dictionary(uniqueKeysWithValues: nums.map { $0.ke })
        var dictionary: [Int: Int] = [:]

        for (index, num) in nums.enumerated() {
            dictionary[num] = index
        }

        print(dictionary)

        for (index, num) in nums.enumerated() {
            let missingNum = target - num

            if let missingNumIndex = dictionary[missingNum], missingNumIndex != index {
                return [index, missingNumIndex]
            }
        }

        return []
    }
}

let sol = Solution()
sol.twoSum([3,2,4], 6)
sol.twoSum([3, 3], 6)
sol.twoSum([2,7,11,15], 9)
