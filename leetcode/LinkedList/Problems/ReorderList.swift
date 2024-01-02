//
//  ReorderList.swift
//  leetcode
//
//  Created by Ron Daryl Magno on 9/11/23.
//

import Foundation

class ReorderList: Solution {
    func reorderList(_ head: ListNode?) {
        // find middle
        var slowPointer: ListNode?
        var fastPointer: ListNode?
        
        slowPointer = head
        fastPointer = head
        
        while fastPointer != nil && fastPointer?.next != nil {
            slowPointer = slowPointer?.next
            fastPointer = fastPointer?.next?.next
        }
        
        // reverse second half
        guard let nextSlow = slowPointer else {
            return
        }
        let reversed = reverseList(nextSlow)

        // merge
        var temp: ListNode?
        var headPointer = head
        var reversedPointer = reversed
        
        while reversedPointer?.next != nil {
            temp = headPointer?.next
            headPointer?.next = reversedPointer
            headPointer = temp
            
            temp = reversedPointer?.next
            reversedPointer?.next = headPointer
            reversedPointer = temp
        }
    }
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode?
        var curr = head
        var next: ListNode?
        
        while curr != nil {
            next = curr?.next
            
            curr?.next = prev
            prev = curr
            curr = next
        }
        
        return prev
    }
     
    static func execute() {
        let solution = ReorderList()
        let node = ListNode.create([1, 2, 3, 4])
        solution.reorderList(node)
        assert(node == ListNode.create([1, 4, 2, 3]))
        
        let node2 = ListNode.create([1, 2, 3, 4, 5])
        solution.reorderList(node2)
        assert(node2 == ListNode.create([1, 5, 2, 4, 3]))
    }
}
