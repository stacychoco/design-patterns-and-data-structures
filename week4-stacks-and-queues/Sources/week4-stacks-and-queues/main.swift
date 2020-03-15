//
//  main.swift
//  Stacks & Queues Homework
//
//  Created by Stacy Nguyen on 3/15/20.
//  Copyright © 2020 Stacy Nguyen. All rights reserved.
//

import Foundation

func main() {
	let stack1 = Stack(stack: [1, 2, 3])
	stack1.push(element: 4)
	
	let pop = try! stack1.pop()
	print(stack1.stack)
	print("\(pop) was just popped!")
	
	if !stack1.isEmpty() {
		print("Stack is not empty!")
	}
	
	try? print("Element peeked at is: \(stack1.peek())")
	stack1.clear()
	print(stack1.stack)
}

main()
