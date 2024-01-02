//
//  ListNode.swift
//  leetcode
//
//  Created by Ron Daryl Magno on 9/11/23.
//

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?

    init() {
        self.val = 0
        self.next = nil
        
    }
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

extension ListNode {
    static func create(_ vals: [Int]) -> ListNode? {
        let rootNode: ListNode?
        var currentNode: ListNode?
        
        if let val = vals.first {
            rootNode = ListNode(val)
            currentNode = rootNode
        } else {
            return nil
        }
        
        guard vals.count > 1 else {
            return rootNode
        }
        
        for index in 1..<vals.count {
            let nextNode = ListNode(vals[index])
            currentNode?.next = nextNode
            currentNode = nextNode
        }
        
        return rootNode
    }
}

extension ListNode: Equatable {
    static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        if lhs.next != nil && rhs.next != nil {
            return lhs.next == rhs.next && lhs.val == rhs.val
        } else if lhs.next == nil && rhs.next != nil {
            return false
        } else if lhs.next != nil && rhs.next == nil {
            return false
        } else {
            return lhs.val == rhs.val
        }
    }
}

extension ListNode: CustomStringConvertible {
    var description: String {
        var values = "\(val)"
        var currentNode = self
        
        while let nextNode = currentNode.next {
            currentNode = nextNode
            values += ", \(currentNode.val)"
        }
        
        return values
    }
}
