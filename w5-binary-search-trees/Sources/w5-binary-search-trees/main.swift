//
//  main.swift
//  Binary Search Tree HW
//
//  Created by Stacy Nguyen on 4/7/20.
//  Copyright © 2020 Stacy Nguyen. All rights reserved.
//
import Foundation

func main() {
	let BST = BinarySearchTree<Int>(fromSortedData: [16, 11, 20, 1, 15, 31, 12])

	print(BST.elements)
	print("height: \(BST.height)")
	print("size: \(BST.size)")
	print(BST.makeBreadthFirstArray())
}

main()