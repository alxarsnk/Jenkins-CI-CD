//
//  AnySortable.swift
//  ExamWork
//
//  Created by Александр Арсенюк on 21.01.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import Foundation

protocol Sortable {
   
    associatedtype SortableObject
    
    func sort(_ array: [SortableObject]) -> [SortableObject]
}

private class AnySortableBox<SortableObject>: Sortable {
    
    func sort(_ array: [SortableObject]) -> [SortableObject] {
        fatalError("Abstarct class")
    }
}

private class SortableBox<SortableBoxObject: Sortable>: AnySortableBox<SortableBoxObject.SortableObject> {
    
    private let boxObject: SortableBoxObject
    
    init(_ boxObject: SortableBoxObject) { 
        self.boxObject = boxObject
    }
    
    override func sort(_ array: [SortableBoxObject.SortableObject]) -> [SortableBoxObject.SortableObject] {
        return boxObject.sort(array)
    }
}

class AnySortable<SortableObject>: Sortable {
    
    
    private let abstractObject: AnySortableBox<SortableObject>
    
    init<SortableType: Sortable>(_ sortable: SortableType) where SortableType.SortableObject == SortableObject {
        abstractObject = SortableBox(sortable)
    }
    
    func sort(_ array: [SortableObject]) -> [SortableObject] {
        return abstractObject.sort(array)
    }
}
