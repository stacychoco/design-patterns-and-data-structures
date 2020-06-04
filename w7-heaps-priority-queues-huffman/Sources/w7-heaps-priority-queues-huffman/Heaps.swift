//
//  Heaps.swift
//  Heaps, Priority Queue, Huffman Encoding HW
//
//  Created by Stacy Nguyen on 4/29/20.
//  Copyright © 2020 Stacy Nguyen. All rights reserved.
//
import Foundation


class Heap<T: Comparable> {

	var array: [T] = [] // array used to implement heap
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
		return array.isEmpty
	}

	func insert(element: T) {

		size += 1
		index = size - 1
		array.append(element)

		while index != 0 && array[index] < array[parent] {
			array.swapAt(index, parent)
			index = parent
		}
	}

	func extractMin() -> T {

		let extractedRoot = array[0]

		array.swapAt(0, size - 1)
		array.remove(at: size - 1)
		size -= 1

		index = 0

		if size >= 3 {
			while array[index] > array[leftChild] || array[index] > array[rightChild] {

				if array[leftChild] <= array[rightChild] {
					array.swapAt(index, leftChild)
					index = leftChild
				}

				else {
					array.swapAt(index, rightChild)
					index = rightChild
				}

				if leftChild > (size - 1) || rightChild > (size - 1) {
					break
				}

			}
		}

		else if size == 2 {
			if array[index] > array[leftChild] {
				array.swapAt(index, leftChild)
			}
		}

		return extractedRoot
	}

}