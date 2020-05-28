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

Homework #9 - Graphs

For the graph, rather than storing elements in the vertices, 
we'll just have each vertex be a unique integer. So when you 
make a new graph with N vertices, assume they are numbered 0
to N-1.

func shortestPathFrom(_ start : Vertex, to end : Vertex ) -> [Int] 
func hasCycle() -> Bool

*/

class Graph {

	var vertexArr = [[Int]]() // array of vertices and their links
	var count = 0 // number of vertices

	// adds an edge (two linked nodes)
	func addEdge( firstVertex : Int, secondVertex : Int ) {

		if vertexArr[firstVertex].isEmpty {
			vertexArr[firstVertex] = []
		}

		if vertexArr[secondVertex].isEmpty {
			vertexArr[secondVertex] = []
		}

		vertexArr[firstVertex].append(secondVertex)
		vertexArr[secondVertex].append(firstVertex)

		count = vertexArr.count
	}

	func removeEdge( firstVertex : Int, secondVertex : Int ) {

		if let index = vertexArr[firstVertex].firstIndex(of: secondVertex) {
			vertexArr[firstVertex].remove(at: index)
		}

		if let index = vertexArr[secondVertex].firstIndex(of: firstVertex) {
			vertexArr[secondVertex].remove(at: index)
		}

	}

	// lists the vertices that are adjacent to checked vertex
	func neighborsOf( vertex : Int ) -> [Int] {
		return vertexArr[vertex] 
	}

	func verticesAreAdjacent( firstVertex : Int, secondVertex : Int ) -> Bool {
		
		if vertexArr[firstVertex].contains(secondVertex) {
			return true
		}

		else {
			return false
		}

	}

	func verticesAreConnected(firstVertex : Int, secondVertex : Int) -> Bool {

		var queue: [Int] = []
		queue.append(firstVertex)

		var visited = Array(repeating: false, count: count)

		while !queue.isEmpty {

			let currentVertex = queue.removeFirst()
			if visited[currentVertex] == false {
				
				visited[currentVertex] = true
				
				for x in vertexArr[currentVertex] {
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



}
