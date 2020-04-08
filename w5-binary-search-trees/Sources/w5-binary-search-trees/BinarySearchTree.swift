//
//  BinarySearchTree.swift
//  Binary Search Tree HW
//
//  Created by Stacy Nguyen on 4/7/20.
//  Copyright © 2020 Stacy Nguyen. All rights reserved.
//
import Foundation

class BSTNode<T: Comparable> {
    var element: T
    var leftChild: BSTNode?
    var rightChild: BSTNode?
    
    init(element: T, leftChild: BSTNode? = nil, rightChild: BSTNode? = nil) {
        self.element = element
        self.leftChild = leftChild
        self.rightChild = rightChild
    }

    var height: Int {
    	var count = 1

    	if self.leftChild !== nil {
	   		count += self.leftChild!.height
   		}

    	if self.rightChild !== nil {
   			
   			if self.leftChild === nil {
   				count += self.rightChild!.height
   			}
   			
   			else {
   				if self.rightChild!.height > self.leftChild!.height {
	   				count = 1 + self.rightChild!.height
	   			}
   			}

   		}

   		return count
    }

    var size: Int {
    	var count = 1
    	
    	if self.leftChild !== nil {
    		count += self.leftChild!.size
    	}

    	if self.rightChild !== nil {
    		count += self.rightChild!.size
    	}

    	return count

    }

    var elements: [T] {
    	var elementsArray: [T] = []
    	elementsArray.append(self.element)
    	
    	if self.leftChild !== nil {
    		elementsArray = self.leftChild!.elements + elementsArray
    	}

    	if self.rightChild !== nil {
    		elementsArray += self.rightChild!.elements
    	}

    	return elementsArray
    }

    func insert(element: T) {
    	let newNode = BSTNode(element: element)

    	if newNode.element < self.element {
    		if self.leftChild === nil {
    			self.leftChild = newNode
    		}

    		else {
    			self.leftChild!.insert(element: element)
    		}
    	}

    	if newNode.element > self.element {
    		if self.rightChild === nil {
    			self.rightChild = newNode
    		}

    		else {
    			self.rightChild!.insert(element: element)
    		}
    	}

    }

    func contains(element: T) -> Bool {
    	
    	if self.element == element {
    		return true
    	}

    	else {

    		if self.leftChild?.contains(element: element) == true {
    			return true
    		}

    		else if self.rightChild?.contains(element: element) == true {
    			return true
    		}

    		else {
    			return false
    		}

    	}
    } 

  //   func delete(element: T) {

		// if self.leftChild?.element == element {
		// 	if self.leftChild.leftChild !== nil {
		// 		self.leftChild = self.leftChild!.leftChild!
		// 	}
		// }

		// else if self.rightChild?.element == element {
		// 	self.rightChild = nil
		// }

		// else {
		// 	if self.leftChild !== nil {
		// 		self.leftChild!.delete(element: element)
		// 	}

		// 	else if self.rightChild !== nil {
		// 		self.rightChild!.delete(element: element)
		// 	}
		// }

  //   }

}

class BinarySearchTree<T: Comparable> {
	
	init(fromSortedData: [T] = []) {
		
		for x in fromSortedData {
			self.insert(element: x)
		}

	}

	var root: BSTNode<T>? = nil

	var height: Int {

		if self.isEmpty {
			return 0
		}

		else {
			return self.root!.height
		}

	}

	var isEmpty: Bool {
		return self.root === nil
	}

	var size: Int {
		if self.isEmpty {
			return 0
		}

		else {
			return self.root!.size
		}
	}

	var elements: [T] {
		if self.isEmpty {
			return []
		}

		else {
			return self.root!.elements
		}
	}

	func insert(element: T) {
		if self.isEmpty {
			let newNode = BSTNode(element: element)
			self.root = newNode
		}

		else {
			self.root!.insert(element: element)
		}
	}

	func contains(element: T) -> Bool {
		if self.isEmpty {
			return false
		}

		else {
			return self.root!.contains(element: element)
		}
	}

	func search(element: T) -> T? {
		if self.contains(element: element) {
			return element
		}

		else {
			return nil
		}
	}

	func makeBreadthFirstArray() -> [T] {
		var makeBreadthFirstArray: [T] = []
		var queue: [BSTNode<T>] = []
		var currentNode = self.root

		if !self.isEmpty {
			queue.append(currentNode!)
		}

		while !queue.isEmpty {
			
			currentNode = queue.removeFirst()
			makeBreadthFirstArray.append(currentNode!.element)
			
			if currentNode!.leftChild !== nil {
				queue.append(currentNode!.leftChild!)
			}

			if currentNode!.rightChild !== nil {
				queue.append(currentNode!.rightChild!)
			}
		}

		return makeBreadthFirstArray
	}

	// func delete(element: T) {
	// 	if self.root?.element == element {
	// 		self.root = nil
	// 	}

	// 	else {
	// 		self.root?.delete(element: element)
	// 	}
	// }

}