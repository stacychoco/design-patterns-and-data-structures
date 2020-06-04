//
//  Graph.swift
//  Graph HW
//
//  Created by Stacy Nguyen on 5/26/20.
//  Copyright © 2020 Stacy Nguyen. All rights reserved.
//
import Foundation

class Graph {

	var vertexArr = [Int: [Int]]() // dictionary of vertices and their links
	// i created an array at first so i called it vertex array, but
	// i would have called it dictionary if I had changed sooner

	var count = 0 // number of vertices

	// adds an edge (two linked nodes)
	func addEdge( firstVertex : Int, secondVertex : Int ) {

		// if the vertices don't exist, create them
		if vertexArr[firstVertex] == nil {
			vertexArr[firstVertex] = []
		}

		if vertexArr[secondVertex] == nil {
			vertexArr[secondVertex] = []
		}

		vertexArr[firstVertex]!.append(secondVertex)
		vertexArr[secondVertex]!.append(firstVertex)

		// i count here because for some reason they dont allow me to count
		// before vertexArr has any elements
		count = vertexArr.count
	}

	func removeEdge( firstVertex : Int, secondVertex : Int ) {

		// remove edges if they exist
		if let index = vertexArr[firstVertex]?.firstIndex(of: secondVertex) {
			vertexArr[firstVertex]!.remove(at: index)
		}

		if let index = vertexArr[secondVertex]?.firstIndex(of: firstVertex) {
			vertexArr[secondVertex]!.remove(at: index)
		}

	}

	func neighborsOf( vertex : Int ) -> [Int] {
		return vertexArr[vertex] ?? []
	}

	func verticesAreAdjacent( firstVertex : Int, secondVertex : Int ) -> Bool {
		
		if vertexArr[firstVertex] != nil {
			if vertexArr[firstVertex]!.contains(secondVertex) {
				return true
			}
		}
		
		return false
	}

	func verticesAreConnected(firstVertex : Int, secondVertex : Int) -> Bool {

		var queue: [Int] = []
		queue.append(firstVertex)

		// visited dict keeps track of which vertices are visited
		var visited: [Int:Bool] = [:]
		for (x, _) in vertexArr {
			visited[x] = false
		}

		// while queue is not empty
		while !queue.isEmpty {

			// dequeue from the front
			let currentVertex = queue.removeFirst()
			for x in vertexArr[currentVertex] ?? [] {
				if visited[x] == false {
					visited[x] = true
					if x == secondVertex {
						return true
					}

					else {
						queue.append(x)
					}
				}
			}

		}

		return false

	}

	func shortestPathFrom(_ start : Int, _ end : Int ) -> [Int] {

		// if they aren't connected, there can't be a path
		if !verticesAreConnected(firstVertex : start, secondVertex : end) {
			return []
		}

		if start == end {
			return [start]
		}

		var path: [Int] = []
		var queue = [start]
		
		// visited dict keeps track of which vertices are visited
		var visited: [Int:Bool] = [:]
		for (x, _) in vertexArr {
			visited[x] = false
		}

		var prev: [Int:Int] = [:]

		queueLoop: while !queue.isEmpty {

			// dequeue from the front
			let currentVertex = queue.removeFirst()

			for x in vertexArr[currentVertex] ?? [] {
				if visited[x] == false {

					visited[x] = true
					prev[x] = currentVertex

					if x == end {
						break queueLoop
					}

					else {
						queue.append(x)
					}

				}
			}

		}

		// while loop used to append elements to path
		var currentVertex = end
		while !path.contains(start) {
			path.insert(currentVertex, at: 0)

			if prev[currentVertex] != nil {
				currentVertex = prev[currentVertex]!
			}

			else {
				break
			}
		}

		return path
	}

	// helper recursive function for hasCycle function
	// this function checks if the "children" of a vertex has a cycle 
	private func hasCycleUtil(v: Int, parent: Int, visited: inout [Int:Bool]) -> Bool {

		visited[v] = true

		for x in vertexArr[v] ?? [] {
			
			if visited[x] == false {
				if hasCycleUtil(v: x, parent: v, visited: &visited) {
					return true
				}
			}

			else if visited[x] == true && x != parent {
				return true
			}

		}

		return false

	}

	func hasCycle() -> Bool {
		
		// visited dict keeps track of which vertices are visited
		var visited: [Int:Bool] = [:]
		for (x, _) in vertexArr {
			visited[x] = false
		}

		for (x, _) in vertexArr {
			if visited[x] == false {
				if hasCycleUtil(v: x, parent: x, visited: &visited) {
					return true
				}
			}
		}

		return false
	}

}
