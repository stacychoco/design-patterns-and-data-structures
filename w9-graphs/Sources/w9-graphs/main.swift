//
//  Graph.swift
//  Graph HW
//
//  Created by Stacy Nguyen on 5/26/20.
//  Copyright © 2020 Stacy Nguyen. All rights reserved.
//
import Foundation

print("Success")

var graph = Graph()

graph.addEdge(firstVertex: 1, secondVertex: 2)
graph.addEdge(firstVertex: 1, secondVertex: 3)
graph.addEdge(firstVertex: 2, secondVertex: 4)
graph.addEdge(firstVertex: 2, secondVertex: 5)
graph.addEdge(firstVertex: 4, secondVertex: 5)
graph.addEdge(firstVertex: 2, secondVertex: 6)
graph.addEdge(firstVertex: 5, secondVertex: 7)

graph.removeEdge(firstVertex: 2, secondVertex: 6)

print(graph.neighborsOf(vertex: 2))
print(graph.vertexArr)
print(graph.count)

let bool = graph.verticesAreAdjacent( firstVertex : 1, secondVertex : 3 )
let bool2 = graph.verticesAreAdjacent( firstVertex : 1, secondVertex : 5 )

if bool == true {
	print("correct answer 1")
}

if bool2 == false {
	print("correct answer 2")
}

let bool3 = graph.verticesAreConnected(firstVertex : 1, secondVertex : 5 )

if bool3 == true {
	print("nice correct again")
}

let bool4 = graph.hasCycle()

if bool4 == true {
	print("true")
}

let path = graph.shortestPathFrom(1, 7)
print(path)