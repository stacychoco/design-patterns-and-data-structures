//
//  BubbleSort.swift
//  Sorting HW
//
//  Created by Stacy Nguyen on 5/2/20.
//  Copyright © 2020 Stacy Nguyen. All rights reserved.
//
import Foundation

extension Array where Element: Comparable {

	// checks if array is sorted
	func isSorted() -> Bool {
		let arr = self

		for i in 0..<(arr.count - 1) {
			if arr[i] > arr[i+1] {
				return false
			}
		}

		return true
	}

	func bubbleSort() -> Array {
		var arr = self

		while !arr.isSorted() {
			for i in 0..<(arr.count - 1) {
				if arr[i] > arr[i+1] {
					arr.swapAt(i, i+1)
				}
			}
		}

		return arr
	}
}