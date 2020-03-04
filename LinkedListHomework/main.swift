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
        var currentNode = self.head   // currentNode loops through the linked list
        var count = 0  // counter to count length of list

        while currentNode !== nil {
            count += 1
            currentNode = currentNode?.next
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

    func insertAt(index: Int, element: Element) {
        
        if index == 0 {
            self.insertAtHead(element: element)
        }

        else if index == self.length {
            self.insertAtTail(element: element)
        }
            
        else {
            var currentNode = self.head
            
            // if index is equal to 1, then there's no need to go through the loop
            if index >= 2 {
                // loop through the linked list in order to find the right placement for insertion
                for _ in 0...(index - 2) {
                    currentNode = currentNode?.next
                }
           }

            let newNode = Node(element: element, next: currentNode?.next)
            currentNode?.next = newNode
        }
    }
    
    func removeFrom(index: Int) {
        
        if index == 0 {
            self.removeFromHead()
        }
        
        else if index == self.length {
            self.removeFromTail()
        }
            
        else {
            var currentNode = self.head
            
            if index >= 2 {
                for _ in 0...(index - 2) {
                    currentNode = currentNode?.next
                }
            }
            
            currentNode?.next = currentNode?.next?.next
        }
    }
    
    func append(list: LinkedList) {
        if list.length > 0 {
            for element in list.toArray() {
                self.insertAtTail(element: element)
            }
        }
        
        // I tried to do this function with the snippets of code below this paragraph, but for some reason it doesn't work.
        // That's why I had to solve this using a different way. The Big O notation is O(n*2) for my current solution
        // and that is not really ideal. I will try my best to find a better way.
        
        //      self.tail?.next = list.head
        //      self.tail = list.tail
    }
    
    func search(element: Element) -> Int? {
        // finds first instance of element in list
        // return type is Int? because if element is not found, this function returns nil
        
        var count: Int? = 0
        var currentNode = self.head
        
        // looping through linked list to find whether the element being searched for matches any in the list
        while currentNode !== nil {
            if element != currentNode!.element {
                count! += 1
            }
            else {
                break
            }
            currentNode = currentNode?.next
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
        
        return indexList
    }
}


func main() {
    let node = Node(element: 1, next: nil)
    let myList = LinkedList(head: node, tail: nil)
    myList.insertAtHead(element: 3)
    myList.insertAtTail(element: 4)
    myList.insertAtTail(element: 8)
    myList.insertAt(index: 4, element: 10)
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
