//
//  ViewController.swift
//  Lab3
//
//  Created by Steven Wong on 24/1/2022.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var currentShape: Circle?
    enum operation{
        case draw
        case move
        case resize
        case rotate
        case erase
    }
    var op:operation = .draw
    var shape_color = UIColor.red // five buttons to change colors

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
    shouldRecognizeSimultaneouslyWith otherGestureRecognizer:
    UIGestureRecognizer) -> Bool {
        true
    }
}

