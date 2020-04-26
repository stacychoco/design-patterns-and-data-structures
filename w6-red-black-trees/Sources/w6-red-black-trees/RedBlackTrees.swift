//
//  RedBlackTree.swift
//  Red Black Tree
//
//  Created by Stacy Nguyen on 4/14/20.
//  Copyright © 2020 Stacy Nguyen. All rights reserved.
//
import Foundation

enum Color {
  case red
  case black
}

class RedBlackNode<T: Comparable> {

  var element: T
  var leftChild: RedBlackNode?
  var rightChild: RedBlackNode?
  var color: Color
  
  init(element: T, leftChild: RedBlackNode? = nil, rightChild: RedBlackNode? = nil) {
      self.element = element
      self.leftChild = leftChild
      self.rightChild = rightChild
      self.color = .red
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

  func rotateLeft() {
    
    if self.rightChild !== nil {

      let newNode = RedBlackNode(element: self.element, leftChild: self.leftChild)
      self.leftChild = newNode

      self.element = self.rightChild!.element

      self.leftChild?.rightChild = self.rightChild?.leftChild

      self.rightChild = self.rightChild?.rightChild

    }

  } 

  func rotateRight() {
    
    if self.leftChild !== nil { 
      
      let newNode = RedBlackNode(element: self.element, rightChild: self.rightChild)
      self.rightChild = newNode

      self.element = self.leftChild!.element

      self.rightChild?.leftChild = self.leftChild?.rightChild

      self.leftChild = self.leftChild?.leftChild

    }

  } 

  func colorFlip() {
    // flips color of current node to red
    // turns all children's colors to black

    self.color = .red
    self.leftChild?.color = .black
    self.rightChild?.color = .black
  }

  func makeTreeBalanced() {

    if self.rightChild?.color == .red {
      self.rotateLeft()
    }

    if (self.leftChild?.color == .red) && (self.leftChild?.leftChild?.color == .red) {
      self.rotateRight()
    }

    if (self.leftChild?.color == .red) && (self.rightChild?.color == .red) {
      self.colorFlip()
    }

    self.leftChild?.makeTreeBalanced()
    self.rightChild?.makeTreeBalanced()

  }

  func isBalanced() -> Bool {

    if self.rightChild?.color == .red {
      return false
    }

    else if (self.leftChild?.color == .red) && (self.leftChild?.leftChild?.color == .red) {
      return false
    }

    else if (self.leftChild?.color == .red) && (self.rightChild?.color == .red) {
      return false
    }

    else {

      if self.leftChild?.isBalanced() == false {
        return false
      }

      else if self.rightChild?.isBalanced() == false {
        return false
      }

      else {
        return true
      }

    }

  }

  func insert(element: T) {
  	let newNode = RedBlackNode(element: element)

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

}

class RedBlackTree<T: Comparable> {
	
	init(fromSortedData: [T] = []) {
		
		for x in fromSortedData {
			self.insert(element: x)
		}

	}

	var root: RedBlackNode<T>? = nil

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

  func makeTreeBalanced() {
    if !self.isEmpty {
      while self.root!.isBalanced() == false {
        self.root!.makeTreeBalanced()
        self.root!.color = .black
      }
    }
  }

	func insert(element: T) {
		if self.isEmpty {
			let newNode = RedBlackNode(element: element)
      newNode.color = .black
			self.root = newNode
		}

		else {
			self.root!.insert(element: element)
		}

    self.makeTreeBalanced()
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
		var queue: [RedBlackNode<T>] = []
		var currentNode = self.root

		// if tree is not empty
		if !self.isEmpty {
			queue.append(currentNode!)
		}

		// while queue is not empty
		while !queue.isEmpty {
			
			// removes and returns the first element of queue to currentNode
			// essentially dequeue
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

}