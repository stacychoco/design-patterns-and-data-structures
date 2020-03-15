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
		self.stack.append(element)
	}

	func pop() throws -> T {

		// if stack is empty an error will throw
		guard !self.isEmpty() else {
			throw StackError.stackIsEmpty
		}
			
		let popElement = self.stack.last!
		self.stack.removeLast()
		return popElement
	}

	func isEmpty() -> Bool {
		if self.stack.isEmpty {
			return true
		}

		else {
			return false
		}
	}

	func peek() throws -> T {

		// if stack is empty an error will throw
		guard !self.isEmpty() else {
			throw StackError.stackIsEmpty
		}

		return self.stack.last!
	}

	func clear() {
		self.stack = []
	}
}