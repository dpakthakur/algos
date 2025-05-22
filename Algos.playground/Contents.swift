import UIKit

class TwoSumSolution {
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
                print(dict)
                return [indx, indxOfComplimentNumber]
            }
            dict[val] = indx
        }
        return []
    }
}

let twoSumSolution = TwoSumSolution()
print(twoSumSolution.refactorTwoSum([2, 7, 11, 15], 22)) // Output: [3, 1]


class Node<T: Equatable>: Equatable {
    let value: T
    var next: Node<T>? = nil
    
    init(value: T) {
        self.value = value
    }
    
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.value == rhs.value
    }
}

class LinkedList<T: Equatable> {
    var head: Node<T>? = nil
    var tail: Node<T>? = nil
    
    func prepend(value: T) {
        var newNode = Node(value: value)
        
        guard self.head != nil else {
            self.head = newNode
            self.tail = newNode
            return
        }
        
        newNode.next = self.head
        self.head = newNode
    }
    
    func append(value: T) {
        var newNode = Node(value: value)
        
        guard self.head != nil else {
            self.head = newNode
            self.tail = newNode
            return
        }
        
        self.tail?.next = newNode
        self.tail = newNode
    }
    
}
