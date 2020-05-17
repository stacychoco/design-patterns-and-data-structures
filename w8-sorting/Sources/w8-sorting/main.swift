//
//  main.swift
//  Sorting HW
//
//  Created by Stacy Nguyen on 5/2/20.
//  Copyright © 2020 Stacy Nguyen. All rights reserved.
//
import Foundation

var array = [Int]((1...50).shuffled())
print(array)

print()

print("Insertion Sort:")
let array1 = array.insertionSorting()
print(array1)

print()

print("Selection Sort:")
let array2 = array.selectionSort()
print(array2)

print()

print("Bubble Sort:")
let array3 = array.bubbleSort()
print(array3)