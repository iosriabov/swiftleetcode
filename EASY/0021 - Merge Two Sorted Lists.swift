/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
     func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1, let l2 = l2 else { return l1 ?? l2}

        if l1.val <= l2.val {
            l1.next = mergeTwoLists(l1.next, l2)
            return l1
        } else {
            l2.next = mergeTwoLists(l1, l2.next)
            return l2
        }
       
    }        
}

import Foundation
// Definition of ListNode with a convenience initializer and print function
class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int, _ next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
    
    // Function to print the list starting from this node
    func printList() {
        var current: ListNode? = self
        while let node = current {
            print("\(node.val)", terminator: node.next != nil ? " -> " : "")
            current = node.next
        }
        print()
    }
}

// Definition of the Solution class with added logs
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        // Log the values at the current recursion level
        print("mergeTwoLists called with:")
        print("l1: ", terminator: "")
        l1?.printList()
        print("l2: ", terminator: "")
        l2?.printList()
        
        // Guard to check for nil
        guard let l1 = l1, let l2 = l2 else {
            print("One of the lists is nil, returning the non-nil list or nil.", l1, l2)
            return l1 ?? l2
        }
        
        // Compare the values of the current nodes
        if l1.val <= l2.val {
            print("l1 (\(l1.val)) is less than or equal to l2 (\(l2.val)), setting l1.next.")
            l1.next = mergeTwoLists(l1.next, l2)
            return l1
        } else {
            print("l2 (\(l2.val)) is less than l1 (\(l1.val)), setting l2.next.")
            l2.next = mergeTwoLists(l1, l2.next)
            return l2
        }
    }
}

// Example of creating lists and calling the function for testing
let list1 = ListNode(1, ListNode(3))
let list2 = ListNode(2, ListNode(4, ListNode(6, ListNode(8))))

print("Initial Lists:")
print("List 1: ", terminator: "")
list1.printList()
print("List 2: ", terminator: "")
list2.printList()

print("\nMerging Lists with Logs:")

// Call the function with logs
let solution = Solution()
let mergedList = solution.mergeTwoLists(list1, list2)

// Print the final merged list
print("\nMerged List: ", terminator: "")
mergedList?.printList()

// Print list2 after merging
print("\nList 2 After Merging: ", terminator: "")
list2.printList()

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else {
            return l2
        }
        guard let l2 = l2 else {
            return l1
        }
        if l1.val <= l2.val {
            l1.next = mergeTwoLists(l1.next, l2)
            return l1
        } else {
            l2.next = mergeTwoLists(l1, l2.next)
            return l2
        }
    }
}
