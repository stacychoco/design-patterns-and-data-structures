//
//  HomeworkFunctions.swift
//  Stacks & Queues Homework
//
//  Created by Stacy Nguyen on 3/15/20.
//  Copyright © 2020 Stacy Nguyen. All rights reserved.
//

import Foundation

func hasCorrectDelimiters(str: String) -> Bool {
	
	// array of characters converted from the string parameter
	let charArray = Array(str)

	// array used for the Stacks
	let stackArray: [Character] = []
	let stack = Stack(stack: stackArray)

	for x in charArray {
		
		// looking at the top of the stack
		let topChar = try? stack.peek()
		
		// if I find an open delimiter, I push it to the stack
		if x == "(" || x == "[" || x == "{" {
			stack.push(element: x)
		}

		// If the open delimiter has a match, I will use pop(), 
		// therefore "closing" the delimiter
		
		else if topChar == "(" && x == ")" {
			_ = try? stack.pop()
		}

		else if topChar == "[" && x == "]" {
			_ = try? stack.pop()
		}

		else if topChar == "{" && x == "}" {
			_ = try? stack.pop()
		}

		// mismatched delimiter
		else if x == ")" || x == "]" || x == "}" {
			
			// in case x is the last element in the string
			if stack.isEmpty() {
				stack.push(element: x)
			}

			else {
				break
			}
		}
	}

	// also, I was thinking that since there are so many if statements,
	// whether it would be more efficient to use 'switch case' instead
	// but after considering for a while I still think this is more efficient.
	// any thoughts?

	if stack.isEmpty() {
		return true
	}

	else {
		return false
	}
}
