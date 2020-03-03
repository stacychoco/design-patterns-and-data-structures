//
//  main.swift
//  LinkedListHomework
//
//  Created by Stacy Nguyen on 3/2/20.
//  Copyright © 2020 Stacy Nguyen. All rights reserved.
//

import Foundation

class Node<Element: Equatable> {
    var element: Element
    var next: Node?
    
    init(element: Element, next: Node?) {
        self.element = element
        self.next = next ?? nil
    }
}

class LinkedList<Element: Equatable> {
    var head: Node<Element>? = nil
    var tail: Node<Element>? = nil
    
    init(head: Node<Element>?, tail: Node<Element>?) {
        self.head = head
        self.tail = tail

        if head === nil {
            self.head = tail
        }

        else if tail === nil {
            self.tail = head
        }
    }
    
    // Level 1

    var firstElement: Element? {
        get {
            return self.head?.element
        }
    }

    var lastElement: Element? {
        get {
            return self.tail?.element
        }
    }

    var length: Int {
        var recurringNode = self.head   // recurringNode loops through the linked list
        var count = 0

        while recurringNode !== nil {
            count += 1
            recurringNode = recurringNode?.next
        }

        return count
    }

    func insertAtHead(element: Element) {
        let newNode = Node(element: element, next: self.head)
        self.head = newNode

        if self.tail === nil {
            self.tail = newNode
        }
    }

    func insertAtTail(element: Element) {
        let newNode = Node(element: element, next: nil)
        self.tail?.next = newNode
        self.tail = newNode

        if self.head === nil {
            self.head = newNode
        }
    }

    func removeFromHead() {
        self.head = self.head?.next
        if self.head === nil {
            self.tail = nil
        }
    }

    func removeFromTail() {
        var recurringNode = self.head

        while recurringNode?.next !== self.tail {
            recurringNode = recurringNode?.next
        }

        self.tail = recurringNode
        self.tail?.next = nil

        if self.tail === nil {
            self.head = nil
        }
    }

    func toArray() -> [Element] {
        var linkedListArray: [Element] = []
        var recurringNode = self.head

        while recurringNode !== nil {
            linkedListArray.append(recurringNode!.element)
            recurringNode = recurringNode?.next
        }

        return linkedListArray
    }

    // Level 2

    func insertAt(index: Int, element: Element) {
        
        if index == 0 {
            self.insertAtHead(element: element)
        }

        else {
           var recurringNode = self.head

           if index >= 2 {
                for _ in 0...(index - 2) {
                    recurringNode = recurringNode?.next
                }
           }

           let newNode = Node(element: element, next: recurringNode?.next)
           recurringNode?.next = newNode
        }
    }
    
    func removeFrom(index: Int) {
        
        if index == 0 {
            self.removeFromHead()
        }
        
        else {
            var recurringNode = self.head
            
            if index >= 2 {
                for _ in 0...(index - 2) {
                    recurringNode = recurringNode?.next
                }
            }
            
            recurringNode?.next = recurringNode?.next?.next
        }
    }
    
    func append(list: LinkedList) {
        for element in list.toArray() {
            insertAtTail(element: element)
        }
    }
    
    func search(element: Element) -> Int? {
        //finds first instance of element in list
        
        var count: Int? = 0
    
        for elementFromArray in self.toArray() {
            if element != elementFromArray {
                count! += 1
            }
            else {
                break
            }
        }
        
        if count == self.length {
            count = nil
        }
        
        return count
    }
    
    func searchForAll(element: Element) -> [Int] {
        //returns all indicies of the list that hold this element
        
        var indexList: [Int] = []
        var count = 0
        
        for elementFromArray in self.toArray() {
            if element != elementFromArray {
                count += 1
            }
            else {
                indexList.append(count)
                count += 1
            }
        }
        
        return indexList
    }
}

func main() {
    let node = Node(element: 1, next: nil)
    let myList = LinkedList(head: node, tail: nil)
    myList.insertAtHead(element: 3)
    myList.insertAtTail(element: 4)
    myList.insertAtTail(element: 8)
    myList.insertAt(index: 0, element: 10)
    myList.removeFrom(index: 1)
    myList.append(list: myList)
    let indexOfSearch = myList.search(element: 1)
    let searchList = myList.searchForAll(element: 1)
    
    print(myList.toArray())
    print()
    print("First element: \(myList.firstElement!)")
    print("Last element: \(myList.lastElement!)")
    print("Length: \(myList.length)")
    print("The index of the first encountered 1 in the list is: \(String(describing: indexOfSearch!))")
    print("All the indices of the list that hold 1 are: \(searchList)")
}

main()
