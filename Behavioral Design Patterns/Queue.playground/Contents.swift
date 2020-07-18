import UIKit

private final class Node<T> {
    var key: T?
    var next: Node?
    
    init(_ value: T? = nil) {
        key = value
    }
}

final class Queue<T> {
    fileprivate var head: Node<T>?
    private var tail: Node<T>?
    
    
    //MARK: - Enqueue Appends a new item to the queue
    
    /*
     If the head is nil, that means that our queue was empty. Thus, the new node becomes the head. The tail and the head refer to the same node when the queue has only one element.
     
     If the queue is not empty, we append the new element by setting the tail’s next reference to the new node. Finally, the new node becomes the tail of the queue.
     */
    
    func enqueue(_ value: T) {
        // Create new node, if the head is empty, the head becomes the new node
        let newNode = Node<T>(value)
        // First elements value has not been set?
        guard head != nil else {
            head = newNode
            tail = head
            return
        }
    }
    
    tail?.next = newNode
    tail = newNode
    
    // MARK: - Dequeue returns the top-level item from the queue. Queue works on the "first in, first out" principle, so the least recently added item gets return
    
    func dequeue() -> T? {
        
        // return nil if heads key contains no value
        guard let headItem = head?.key else {
            return nil
        }
        
        //Otherwise, we check if the head has a valid next node. If it does, we set the head reference to the next node. If the head is the only node in the queue, we set both head and the tail to nil.
        
        if let nextNode = head?.next {
            head = nextNode
        } else {
            head = nil
            tail = nil
        }
        return headItem
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func peek() -> T? {
        return head?.key
    }
}

//MARK: - Lets use the Queue now

var queue 




