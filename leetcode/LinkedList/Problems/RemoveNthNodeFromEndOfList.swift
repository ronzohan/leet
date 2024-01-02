//
//  RemoveNthNodeFromEndOfList.swift
//  leetcode
//
//  Created by Ron Daryl Magno on 9/15/23.
//
//  https://leetcode.com/problems/remove-nth-node-from-end-of-list/

import Foundation

class RemoveNthNodeFromEndOfList: Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummyHead = ListNode(0)
        dummyHead.next = head

        var lPointer: ListNode? = dummyHead

        var rPointer = head
        // Move rPointer n times
        for _ in 0..<n {
            rPointer = rPointer?.next
        }

        while rPointer != nil {
            // Move lPointer once
            lPointer = lPointer?.next
            rPointer = rPointer?.next
        }

        lPointer?.next = lPointer?.next?.next

        return dummyHead.next
    }

    static func execute() {
        let solution = RemoveNthNodeFromEndOfList()
        assert(solution.removeNthFromEnd(ListNode.create([1, 2, 3, 4, 5]), 2) == ListNode.create([1, 2, 3, 5]))

        assert(solution.removeNthFromEnd(ListNode.create([1]), 1) == ListNode.create([]))

        assert(solution.removeNthFromEnd(ListNode.create([1, 2]), 2) == ListNode.create([2]))
    }
}
