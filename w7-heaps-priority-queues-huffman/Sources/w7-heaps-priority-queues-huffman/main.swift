func main() {
	let heap = Heap<Int>()
	heap.insert(element: 3)
	heap.insert(element: 2)
	heap.insert(element: 1)
	heap.insert(element: 5)
	heap.insert(element: 4)
	print("Success")
	print(heap.heap)

	_ = heap.extractMin()
	print(heap.heap)
}

main()