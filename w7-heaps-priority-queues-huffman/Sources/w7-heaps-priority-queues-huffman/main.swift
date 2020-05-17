//
//  main.swift
//  Heaps, Priority Queue, Huffman Encoding HW
//
//  Created by Stacy Nguyen on 4/29/20.
//  Copyright © 2020 Stacy Nguyen. All rights reserved.
//

import Foundation

func main() {
	let heap = Heap<Int>()
	heap.insert(element: 3)
	heap.insert(element: 2)
	heap.insert(element: 1)
	heap.insert(element: 5)
	heap.insert(element: 4)
	print("Success")
	print(heap.heap)
	let _ = heap.extractMin()
	print(heap.heap)
}

main()