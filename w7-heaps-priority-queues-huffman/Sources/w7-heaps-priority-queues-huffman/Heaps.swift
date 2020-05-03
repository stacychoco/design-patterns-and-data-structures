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
	var size = 0 // size of heap
	var index = 0 // I'm taking note of a current index in the heap

	var parent: Int {
		return (index-1)/2 // parent of current index
	}

	var leftChild: Int {
		return 2*index + 1 // left child of current index
	}

	var rightChild: Int {
		return 2*index + 2 // right child of current index
	}

	var isEmpty: Bool {
		return heap.isEmpty
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

		let extractedRoot = heap[0]
		heap.remove(at: 0)
		size -= 1

		let lastElement = heap[(size - 1)]
		heap.remove(at: (size - 1))
		
		heap.insert(lastElement, at: 0)

		index = 0

		while heap[index] > heap[leftChild] || heap[index] > heap[rightChild] {

			if heap[leftChild] <= heap[rightChild] {
				heap.swapAt(index, leftChild)
				index = leftChild
			}

			else {
				heap.swapAt(index, rightChild)
				index = rightChild
			}

			if leftChild > (size - 1) || rightChild > (size - 1) {
				break
			}

		}

		return extractedRoot
	}

}