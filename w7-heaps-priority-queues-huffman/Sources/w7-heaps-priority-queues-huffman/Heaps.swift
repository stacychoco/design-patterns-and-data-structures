//
//  BinarySearchTree.swift
//  Binary Search Tree HW
//
//  Created by Stacy Nguyen on 4/7/20.
//  Copyright © 2020 Stacy Nguyen. All rights reserved.
//
import Foundation


class Heap<T: Comparable> {

	var heap: [T] = []
	var size = 0
	var index = 0

	var parent: Int {
		return (index-1)/2
	}

	var leftChild: Int {
		return 2*index + 1
	}

	var rightChild: Int {
		return 2*index + 2
	}

	var isEmpty: Bool {
		if size == 0 {
			return true
		}

		else {
			return false
		}
	}

	func insert(element: T) {

		size += 1
		index = size - 1
		heap.append(element)

		while index != 0 && heap[index] < heap[parent] {
			heap.swapAt(index, parent)
			index = parent
		}
	}

	func extractMin() -> T {

		heap.remove(at: 0)
		index = 0

		if heap[0] > heap[leftChild] {
			heap.swapAt(0, leftChild)
		} 

		else if heap[0] > heap[rightChild] {
			heap.swapAt(0, rightChild)
		}

		return heap[0]
	}

}