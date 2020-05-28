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
Does the list of adjacent vertices + connected vertices

Homework #9 - Graphs

For the graph, rather than storing elements in the vertices, 
we'll just have each vertex be a unique integer. So when you 
make a new graph with N vertices, assume they are numbered 0
to N-1.

func shortestPathFrom(_ start : Vertex, to end : Vertex ) -> [Int] 
func hasCycle() -> Bool

*/

class Graph {

	init() {
		var vertexArr = [[Int]]()
		var vertices = vertexArr.count
		var visited = Array(repeating: false, count: vertices)

	}

	// adds an edge (two linked nodes)
	func addEdge( firstVertex : Int, secondVertex : Int ) {
		vertexArr[firstVertex].append(secondVertex)
		vertexArr[secondVertex].append(firstVertex)
	}

	func removeEdge( firstVertex : Int, secondVertex : Int ) {

		if let index = vertexArr[firstVertex].index(of: secondVertex) {
			vertexArr[firstVertex].remove(at: index)
		}

		if let index = vertexArr[secondVertex].index(of: firstVertex) {
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

		if visited[firstVertex] == false {
			
			visited[firstVertex] = true
			
			for x in vertexArr[firstVertex] {
				if x == secondVertex {
					return true
				}

				else {
					verticesAreConnected(firstVertex: x, secondVertex: secondVertex)
				}
			}

		}

	} 



}
