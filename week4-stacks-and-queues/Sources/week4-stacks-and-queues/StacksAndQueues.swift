//
//  StacksAndQueues.swift
//  Stacks & Queues Homework
//
//  Created by Stacy Nguyen on 3/15/20.
//  Copyright © 2020 Stacy Nguyen. All rights reserved.
//

import Foundation

class Stack<T> {

	var stack: Array<T>

	init(stack: Array<T> = []) {
		self.stack = stack		
	}

	func push(element: T) {
	// puts element on top of stack
		
		self.stack.append(element)
	}

	func pop() -> T? {
	// *removes and returns* the top element in the stack

		let popElement = self.stack.last
		
		if !self.stack.isEmpty {
			self.stack.removeLast()
		}
		
		return popElement
	}

	func peek() -> T? {
	// returns the top element in the stack

		return self.stack.last
	}

	func clear() {
	// removes all items from the stack
		self.stack = []
	}

	var size: Int {
		return self.stack.count
	}

	var isEmpty: Bool {
	// checks if stack is empty

		if self.stack.isEmpty {
			return true
		}

		else {
			return false
		}
	}

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

	func dequeue() -> T? {
	// *removes and returns* first element from front of queue
			
		let dequeueElement = self.queue.first

		if !self.queue.isEmpty {
			self.queue.remove(at: 0)
		}

		return dequeueElement
	}

	func front() -> T? {
	// returns the first element from front of queue
		return self.queue.first
	}

	func clear() {
	// removes all elements from queue
		self.queue = []
	}

	var size: Int {
		return self.queue.count
	}

	var isEmpty: Bool {
	// checks if queue is empty

		if self.queue.isEmpty {
			return true
		}

		else {
			return false
		}
	}

}