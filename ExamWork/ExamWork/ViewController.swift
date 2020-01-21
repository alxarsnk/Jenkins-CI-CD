//
//  ViewController.swift
//  ExamWork
//
//  Created by Александр Арсенюк on 21.01.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkSortable()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkAnimatable()
    }
    
    private func checkSortable() {
        
        let intArrObject = ArrayObject<Int>()
        let arr = [8,4,6,1,4]
        intArrObject.sort(arr).map { print($0, terminator: " ") }
        
        
        let strArrObject = ArrayObject<String>()
        let strArr = ["5","01", "abcd", "ab", "a"]
        print("\n")
        strArrObject.sort(strArr).map { print($0, terminator: " ") }
    }
    
    private func checkAnimatable() {
        
        let labelAnimate = LabelAnimatable()
        labelAnimate.animate(textLabel)
        
        let buttonAnimate = ButtonAnimatable()
        buttonAnimate.animate(button)
    }
}


class ArrayObject<obj: Comparable>: Sortable {
    
    typealias SortableObject = obj
    
    func sort(_ array: [obj]) -> [obj] {
        var copyArray = array
        copyArray.sort { return $0 < $1 }
        return copyArray
    }
}

class LabelAnimatable: Animatable {
    
    typealias AnimatableObject = UILabel
    
    func animate(_ animateObject: UILabel) {
        
        UIView.animate(withDuration: 1) {
            animateObject.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }

        UIView.animate(withDuration: 1) {
            animateObject.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2)
        }
    }
}

class ButtonAnimatable: Animatable {
    
    typealias AnimatableObject = UIButton
    
    func animate(_ animateObject: UIButton) {
        
        let width = animateObject.frame.width
        let height = animateObject.frame.height
        let x = animateObject.center.x
        let y = animateObject.center.y
    
        UIView.animate(withDuration: 0.25, animations: {
            animateObject.frame = CGRect(x: x + 50, y: y, width: width, height: height)
        }) { completion in
            UIView.animate(withDuration: 0.25, animations: {
                animateObject.frame = CGRect(x: x + 50, y: y+50, width: width, height: height)
            }) { completion in
                UIView.animate(withDuration: 0.25, animations: {
                    animateObject.frame = CGRect(x: x, y: y+50, width: width,   height: height)
                }) {completion in
                    
                    UIView.animate(withDuration: 0.25) {
                        animateObject.frame = CGRect(x: x, y: y, width: width, height: height)
                    }
                }
            }
        }
    }
}
