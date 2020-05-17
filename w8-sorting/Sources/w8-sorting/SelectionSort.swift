//
//  SelectionSort.swift
//  Sorting HW
//
//  Created by Stacy Nguyen on 5/2/20.
//  Copyright © 2020 Stacy Nguyen. All rights reserved.
//
import Foundation

extension Array where Element: Comparable {
	
	func selectionSort() -> Array {
		var arr = self  // array

		for i in 0..<(arr.count - 1) {
			
			var currIndex = i // current index
			var minIndex = i  // index of the smallest element

			while currIndex < arr.count {
				
				if arr[currIndex] < arr[minIndex] {
					minIndex = currIndex
				}

				currIndex += 1
			}

			arr.swapAt(i, minIndex)
		}

		return arr
	}
}
