//
//  main.swift
//  Stacks & Queues Homework
//
//  Created by Stacy Nguyen on 3/15/20.
//  Copyright © 2020 Stacy Nguyen. All rights reserved.
//

import Foundation

func stackTest() {
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

func queueTest() {
	let queue1 = Queue(queue: ["this", "is", "a", "string"])
	queue1.enqueue(element: "!")
	print(queue1.queue)

	let dequeue = try! queue1.dequeue()
	print("'\(dequeue)' is the dequeued element!")
	
	let firstElement = try! queue1.first()
	print("The first element of the queue is: \(firstElement)")

	queue1.clear()
	print(queue1.queue)

}

func main() {
	print()
	print("Let the stack test begin!")
	
	stackTest()
	
	print()
	print("On to the queue test...")
	
	queueTest()
}

main()
