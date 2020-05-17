//
//  main.swift
//  Sorting HW
//
//  Created by Stacy Nguyen on 5/2/20.
//  Copyright © 2020 Stacy Nguyen. All rights reserved.
//
import Foundation

var array = [Int]((0..<100).shuffled())
print(array)

print()

array = array.selectionSort()
print(array)