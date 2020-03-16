//
//  main.swift
//  Stacks & Queues Homework
//
//  Created by Stacy Nguyen on 3/15/20.
//  Copyright © 2020 Stacy Nguyen. All rights reserved.
//

import Foundation

enum StackError: Error {
	case stackIsEmpty
}

class Stack<T> {
	var stack: Array<T>

	init(stack: Array<T> = []) {
		self.stack = stack		
	}

	func push(element: T) {
	// puts element on top of stack
		
		self.stack.append(element)
	}

	func pop() throws -> T {
	// *removes and returns* the top element in the stack

		// if stack is empty an error will throw
		guard !self.isEmpty() else {
			throw StackError.stackIsEmpty
		}
			
		let popElement = self.stack.last!
		self.stack.removeLast()
		return popElement
	}

	func isEmpty() -> Bool {
	// checks if stack is empty

		if self.stack.isEmpty {
			return true
		}

		else {
			return false
		}
	}

	func peek() throws -> T {
	// returns the top element in the stack

		// if stack is empty an error will throw
		guard !self.isEmpty() else {
			throw StackError.stackIsEmpty
		}

		return self.stack.last!
	}

	func clear() {
	// removes all items from the stack
		self.stack = []
	}
}

enum QueueError: Error {
	case queueIsEmpty
}

class Queue<T> {
	var queue: Array<T>

	init(queue: Array<T> = []) {
		self.queue = queue		
	}

	func enqueue(element: T) {
	// puts element at the end of the queue
	
		self.queue.append(element)
	}

	func dequeue() throws -> T {
	// *removes and returns* first element from front of queue

		// if queue is empty an error will throw
		guard !self.isEmpty() else {
			throw QueueError.queueIsEmpty
		}
			
		let dequeueElement = self.queue.first!
		self.queue.remove(at: 0)
		return dequeueElement
	}

	func isEmpty() -> Bool {
	// checks if queue is empty

		if self.queue.isEmpty {
			return true
		}

		else {
			return false
		}
	}

	func first() throws -> T {
	// returns the first element from front of queue

		// if queue is empty an error will throw
		guard !self.isEmpty() else {
			throw QueueError.queueIsEmpty
		}

		return self.queue.first!
	}

	func clear() {
	// removes all elements from queue
		self.queue = []
	}
}