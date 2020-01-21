//
//  AnyAnimatable.swift
//  ExamWork
//
//  Created by Александр Арсенюк on 21.01.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import Foundation

protocol Animatable {
    
    associatedtype AnimatableObject
    
    func animate(_ animateObject: AnimatableObject)
}

private class AnyAnimatableBox<AnimatableObject>: Animatable {
   
    func animate(_ animateObject: AnimatableObject) {
        fatalError("Abstarct class")
    }
}

private class AnimatableBox<AnimatableBoxObject: Animatable>: AnyAnimatableBox<AnimatableBoxObject.AnimatableObject> {
    
    private let animatableBoxObject: AnimatableBoxObject
    
    init(_ animatableBoxObject: AnimatableBoxObject) {
        self.animatableBoxObject = animatableBoxObject
    }
    
    override func animate(_ animateObject: AnimatableBoxObject.AnimatableObject) {
        return animatableBoxObject.animate(animateObject)
    }
}

private class AnyAnimatable<AnimatableObject>: Animatable {
    
    private let abstractObject: AnyAnimatableBox<AnimatableObject>
    
    init<AnimatableType: Animatable>(_ abstarctObject: AnimatableType) where AnimatableType.AnimatableObject == AnimatableObject {
        self.abstractObject = AnimatableBox(abstarctObject)
    }
    
    
    func animate(_ animateObject: AnimatableObject) {
        return abstractObject.animate(animateObject)
    }
}
