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
		var array = self
		
		// temporary index
		for tempIndex in 1..<array.count {

			// temporary element
			let tempElement = array[tempIndex]
			
			// current index
			var currIndex = tempIndex - 1

			while currIndex >= 0 && tempElement < array[currIndex] {
				array[currIndex + 1] = array[currIndex]
				currIndex -= 1
			}

			array[currIndex + 1] = tempElement
		}

		return array
	}
}
