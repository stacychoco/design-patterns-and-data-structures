//
//  main.swift
//  Sorting HW
//
//  Created by Stacy Nguyen on 5/2/20.
//  Copyright © 2020 Stacy Nguyen. All rights reserved.
//
import Foundation

func printTimeElapsed() {

	// very rough draft of a print time elapsed function
	// I actually used this for the calculations chart,
	// but admittedly, I didn't really refine it or finish it.

	var totalTime: Double = 0

	for _ in 0...99 {

		let array = [Int]((1...1000).shuffled())
		let start = DispatchTime.now() // <<<<<<<<<< Start time
		_ = array.bubbleSort()
		let end = DispatchTime.now()   // <<<<<<<<<<   end time

		let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
		let timeInterval = Double(nanoTime) / 1_000_000_000 // Technically could overflow for long running tests
		totalTime += timeInterval
	}

	totalTime = totalTime / 100
	print(totalTime)
}