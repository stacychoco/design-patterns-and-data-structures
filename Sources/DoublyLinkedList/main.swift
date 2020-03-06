//
//  main.swift
//  DoublyLinkedList
//
//  Created by Stacy Nguyen on 3/5/20.
//  Copyright © 2020 Stacy Nguyen. All rights reserved.
//

import Foundation

enum LinkedListError: Error {
    case indexOutOfBounds
    case elementNotFound
}

class Node<Element: Equatable> {
    var element: Element
    var next: Node? // next Node
    var prev: Node? // previous Node
    
    init(element: Element, next: Node? = nil, prev: Node? = nil) {
        self.element = element
        self.next = next
        self.prev = prev
    }
}

class LinkedList<Element: Equatable> {
    var head: Node<Element>? = nil
    var tail: Node<Element>? = nil
    
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
        var currentNode = self.head   // currentNode loops through the linked list
        var count = 0  // counter to count length of list

        while currentNode !== nil {
            count += 1
            currentNode = currentNode?.next
        }

        return count
    }

    func isEmpty() -> Bool {
        // Check whether list is empty or not. I made this function for convenience.

        if self.head === nil {
            return true
        }
        else {
            return false
        }
    }

    func insertAtHead(element: Element) {
        let newNode = Node(element: element, next: self.head)
        self.head?.prev = newNode 
        self.head = newNode

        if self.tail === nil {
            self.tail = newNode
        }
    }

    func insertAtTail(element: Element) {
        let newNode = Node(element: element, prev: self.tail)
        self.tail?.next = newNode
        self.tail = newNode

        if self.head === nil {
            self.head = newNode
        }
    }

    func removeFromHead() {
        self.head = self.head?.next
        self.head?.prev = nil
        if self.head === nil {
            self.tail = nil
        }
    }

    func removeFromTail() {
        var currentNode = self.head

        while currentNode?.next !== self.tail {
            currentNode = currentNode?.next
        }

        self.tail = currentNode
        self.tail?.next = nil

        if self.tail === nil {
            self.head = nil
        }
    }

    func toArray() -> [Element] {
        var linkedListArray: [Element] = []
        var currentNode = self.head

        while currentNode !== nil {
            linkedListArray.append(currentNode!.element)
            currentNode = currentNode?.next
        }

        return linkedListArray
    }

    // Level 2

    func insertAt(index: Int, element: Element) throws {
        
        if index < 0 || index > self.length {
            throw LinkedListError.indexOutOfBounds
        }

        else {
            if index == 0 {
                self.insertAtHead(element: element)
            }

            else if index == self.length {
                self.insertAtTail(element: element)
            }
                
            else {
                var currentNode = self.head
                
                // loop through the linked list until the current node is the one before the index position
                for _ in 0..<(index - 1) {
                    currentNode = currentNode?.next
                }

                let newNode = Node(element: element, next: currentNode?.next, prev: currentNode)
                currentNode?.next?.prev = newNode
                currentNode?.next = newNode
            }
        }
    }
    
    func removeFrom(index: Int) throws {

        if index < 0 || index > self.length {
            throw LinkedListError.indexOutOfBounds
        }
        
        else {

            if index == 0 {
                self.removeFromHead()
            }
            
            else if index == self.length {
                self.removeFromTail()
            }
                
            else {
                var currentNode = self.head
                
                for _ in 0..<(index - 1) {
                    currentNode = currentNode?.next
                }

                currentNode?.next?.next?.prev = currentNode
                currentNode?.next = currentNode?.next?.next
            }
        }
    }
    
    func append(list: LinkedList) {

        if self.isEmpty() {
            self.head = list.head
            self.tail = list.tail
        }

        else {
            self.tail?.next = list.head
            list.head?.prev = self.tail

            // if list is not empty
            if !list.isEmpty() {
                self.tail = list.tail
            }
        }
    }
    
    func search(element: Element) throws -> Int {
        // finds first instance of element in list
        
        var count: Int = 0
        var currentNode = self.head
        
        // looping through linked list to find whether the element being searched for matches any in the list
        
        while currentNode !== nil {
            if element != currentNode!.element {
                count += 1
            }
            else {
                break
            }
            currentNode = currentNode?.next
        }


        // if element is not found, the whole loop is completed and it doesn't break before hand.
        // hence, count is equal to length in this case.
        // if the element is the last one in the list, the count should be length - 1
        
        if count == self.length {
            throw LinkedListError.elementNotFound
        }
        
        else {
            return count
        }
    }
    
    func searchForAll(element: Element) throws -> [Int] {
        //returns all indicies of the list that hold this element
        
        var indexList: [Int] = []
        var count = 0
        var currentNode = self.head
        
        while currentNode !== nil {
            if element != currentNode!.element {
                count += 1
            }
            else {
                indexList.append(count)
                count += 1
            }
            currentNode = currentNode?.next
        }

        if indexList.isEmpty {
            throw LinkedListError.elementNotFound
        }
        
        else {
            return indexList
        }
    }
}


func main() {
    let myList = LinkedList<Int>()
    let myList2 = LinkedList<Int>()
    
    myList.insertAtHead(element: 3)
    myList.insertAtTail(element: 4)
    myList.insertAtTail(element: 9)
    try? myList.insertAt(index: 1, element: 10)
    
    myList2.insertAtHead(element: 3)
    myList2.insertAtTail(element: 5)
    myList2.insertAtTail(element: 7)
    try? myList2.insertAt(index: 1, element: 10)
    
    myList.append(list: myList2)
    
    let indexOfSearch = try! myList.search(element: 10)
    let searchList = try! myList.searchForAll(element: 10)
    
    print(myList.toArray())
    print()
    print("First element: \(myList.firstElement!)")
    print("Last element: \(myList.lastElement!)")
    print("Length: \(myList.length)")

    // the string describing stuff is put there in case the value returned is nil
    print("The index of the first encountered 10 in the list is: \(String(describing: indexOfSearch))")
    print("All the indices of the list that hold 10 are: \(String(describing: searchList))")
}

main()
