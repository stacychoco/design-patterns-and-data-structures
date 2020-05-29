//
//  Graph.swift
//  Graph HW
//
//  Created by Stacy Nguyen on 5/26/20.
//  Copyright © 2020 Stacy Nguyen. All rights reserved.
//
import Foundation

/*

QUESTIONS FOR JUSTIN

Does the list of neighbors contains the vertex itself?
Does the list of adjacent vertices + connected vertices contains the vertex itself?
Does remove edge remove all disconnected vertices?
Would it be necessary to create an initializer?

*/

class Graph {

	var vertexArr = [Int: [Int]]() // array of vertices and their links
	var count = 0 // number of vertices

	// adds an edge (two linked nodes)
	func addEdge( firstVertex : Int, secondVertex : Int ) {

		if vertexArr[firstVertex] == nil {
			vertexArr[firstVertex] = []
		}

		if vertexArr[secondVertex] == nil {
			vertexArr[secondVertex] = []
		}

		vertexArr[firstVertex]!.append(secondVertex)
		vertexArr[secondVertex]!.append(firstVertex)

		count = vertexArr.count
	}

	func removeEdge( firstVertex : Int, secondVertex : Int ) {

		if let index = vertexArr[firstVertex]?.firstIndex(of: secondVertex) {
			vertexArr[firstVertex]!.remove(at: index)
		}

		if let index = vertexArr[secondVertex]?.firstIndex(of: firstVertex) {
			vertexArr[secondVertex]!.remove(at: index)
		}

	}

	// lists the vertices that are adjacent to checked vertex
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

		// visited array keeps track of which vertices are visited
		var visited = Array(repeating: false, count: count)

		// while queue is not empty
		while !queue.isEmpty {

			// dequeue from the front
			let currentVertex = queue.removeFirst()
			if visited[currentVertex] == false {
				
				visited[currentVertex] = true
				
				for x in vertexArr[currentVertex] ?? [] {
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

	func shortestPathFrom(_ start : Int, to end : Int ) -> [Int] {

		// set distance
		// set previous array

		// set queue

		return []
	}

	// helper recursive function for hasCycle function
	func hasCycleUtil(v: Int, visited: inout [Bool]) -> Bool {

		visited[v] = true

		for x in vertexArr[v] ?? [] {
			
			if visited[x] == false {
				if hasCycleUtil(v: x, visited: &visited) {
					return true
				}
			}

			else if x != v {
				return true
			}
		}

		return false

	}

	func hasCycle() -> Bool {

		var visited = Array(repeating: false, count: count)

		for (x, _) in vertexArr {
			if visited[x] == false {
				if hasCycleUtil(v: x, visited: &visited) {
					return true
				}
			}
		}

		return false
	}

}
