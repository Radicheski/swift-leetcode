//
//  Node.swift
//

public class GenericNode<T> {
    public var val: T
    public var children: [GenericNode<T>]
    
    // MARK: Populating Next Right Pointers in Each Node definition
    public var left: GenericNode<T>?
    public var right: GenericNode<T>?
    public var next: GenericNode<T>?
    
    // MARK: Copy List with Random Pointer
    public var random: GenericNode<T>?
    
    // MARK: Construct Quad Tree
    public var isLeaf: Bool = false
    public var topLeft: GenericNode<T>?
    public var topRight: GenericNode<T>?
    public var bottomLeft: GenericNode<T>?
    public var bottomRight: GenericNode<T>?
    
    public init(_ val: T) {
        self.val = val
        self.children = []
    }
}

extension GenericNode {
    static func parseTree(from array: [T?]) -> GenericNode<T>? {
        if array.compactMap( { $0 } ).isEmpty { return nil }
        
        var array = array
        
        var nodes = [GenericNode]()
        var children = [GenericNode]()
        var counter = 0
        
        while !array.isEmpty {
            if let nextValue = array.removeFirst() {
                children.append(GenericNode(nextValue))
            } else {
                if nodes.isEmpty {
                    nodes.append(contentsOf: children)
                    children.removeAll()
                } else {
                    nodes.append(contentsOf: children)
                    nodes[counter].children = children
                    children.removeAll()
                    counter += 1
                }
            }
        }
        
        nodes[counter].children = children
        
        return nodes.first
    }
}
