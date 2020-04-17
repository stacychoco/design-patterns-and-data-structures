//
//  main.swift
//  Red Black Tree
//
//  Created by Stacy Nguyen on 4/14/20.
//  Copyright © 2020 Stacy Nguyen. All rights reserved.
//
import Foundation

func main() {
  print("The code compiles I guess :/")

  let RBT = RedBlackTree<Int>(fromSortedData: [4, 7, 1, 8, 3, 6, 10, 2, 9, 5])
  print(RBT.makeBreadthFirstArray())
  print(RBT.height)
}

main()