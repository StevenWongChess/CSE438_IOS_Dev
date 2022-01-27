//
//  ViewController.swift
//  Lab3
//
//  Created by Steven Wong on 24/1/2022.
//

import UIKit
import SwiftUI
//import Foundation

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var Canvas: DrawingView!
    @IBOutlet weak var modeSelector: UISegmentedControl!
    @IBOutlet weak var shapeSelector: UISegmentedControl!
    @IBOutlet weak var colorSelector: UISegmentedControl!

    var currentShape: Shape?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Canvas = DrawingView(frame: view.frame)
        Canvas.backgroundColor = UIColor.white
        view.addSubview(Canvas)
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.respond_to_pinch(gesture:)))
        pinch.delegate = self
    //        view.isUserInteractionEnabled = true
        Canvas.addGestureRecognizer(pinch)
        let rotation = UIRotationGestureRecognizer(target: self, action: #selector(ViewController.respond_to_rotation(gesture:)))
        rotation.delegate = self
        Canvas.addGestureRecognizer(rotation)
        
        let tags = ["red", "orange", "yellow", "green", "blue", "purple"]
        for (index, i) in tags.enumerated(){
            colorSelector.setTitle(i, forSegmentAt: index)
        }
        
    }
    
    var op:operation = .draw
    var shape_color = UIColor.red
    var shape_flag:Int = 1

    @IBAction func shape_selector(_ sender: UISegmentedControl) {
        shape_flag = sender.selectedSegmentIndex
    }
    
    @IBAction func color_selector(_ sender: UISegmentedControl) {
        let colors = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.blue, UIColor.purple]
        shape_color = colors[sender.selectedSegmentIndex]
    }
    
    @IBAction func action_selector(_ sender: UISegmentedControl) {
        let ops:[operation] = [.draw, .move, .erase]
        op = ops[sender.selectedSegmentIndex]
    }
    
    @IBAction func RemoveAll(_ sender: Any) {
        print("deleting")
        Canvas.items.removeAll()
//        Canvas.items = []
    }
    
    var ith = -1;
    var touch_begin = CGPoint.zero
    
    @objc func respond_to_pinch(gesture: UIPinchGestureRecognizer){
        if(op == .move){
            if gesture.state == UIGestureRecognizer.State.began{
                let size = Canvas.items.count
                if(size == 0){
                    return
                }
                for i in (0...(size - 1)).reversed(){
                    if(Canvas.items[i].contains(point: gesture.location(in: Canvas))){
                        ith = i
                        break;
                    }
                }
            }
            else if(gesture.state == .changed){
                if(ith != -1){
                    let scale_ = gesture.scale
                    (Canvas.items[ith] as! Shape).resize(r: scale_)
                    Canvas.items[ith] = Canvas.items[ith]
                }
            }
            else if(gesture.state == .ended){
                if(ith != -1){
                    let scale_ = gesture.scale
                    (Canvas.items[ith] as! Shape).resize(r: scale_)
                    (Canvas.items[ith] as! Shape).resize_end()
                    (Canvas.items[ith] as! Shape).resize(r: 1.0)
                    Canvas.items[ith] = Canvas.items[ith]
                }
                ith = -1
            }
        }
    }
    
    @objc func respond_to_rotation(gesture: UIRotationGestureRecognizer){
        if(op == .move){
            if gesture.state == UIGestureRecognizer.State.began{
                let size = Canvas.items.count
                if(size == 0){
                    return
                }
                for i in (0...(size - 1)).reversed(){
                    if(Canvas.items[i].contains(point: gesture.location(in: Canvas))){
                        ith = i
                        break;
                    }
                }
            }
            else if(gesture.state == .changed){
                if(ith != -1){
                    let rotation_ = gesture.rotation
                    (Canvas.items[ith] as! Shape).rotate(a: rotation_)
                    Canvas.items[ith] = Canvas.items[ith]
                }
            }
            else if(gesture.state == .ended){
                if(ith != -1){
                    let rotation_ = gesture.rotation
                    (Canvas.items[ith] as! Shape).rotate(a: rotation_)
                    (Canvas.items[ith] as! Shape).rotate_end()
                    (Canvas.items[ith] as! Shape).rotate(a: 0)
                    Canvas.items[ith] = Canvas.items[ith]
                }
                ith = -1
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard touches.count == 1 else{return}
        let touchPoint = (touches.first)!.location(in: Canvas) as CGPoint
        if(op == .draw){
            if(shape_flag == 0){
                currentShape = Square(origin: touchPoint, color: shape_color, width: 0, height: 0)
            }
            else if(shape_flag == 1){
                currentShape = Circle(origin: touchPoint, color: shape_color, radius: 0)
            }
            else{
                currentShape = Triangle(origin: touchPoint, color: shape_color, radius: 0)
            }
            if let newShape = currentShape{
                Canvas.items.append(newShape)
            }
        }
        else if(op == .move || op == .erase){
            touch_begin = touchPoint
            let size = Canvas.items.count
            if(size == 0){
                return
            }
            for i in (0...(size - 1)).reversed(){
                if(Canvas.items[i].contains(point: touchPoint)){
                    ith = i
                    break;
                }
            }
            if(op == .erase && ith != -1){
                Canvas.items.remove(at: ith)
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchPoint = (touches.first)!.location(in: Canvas) as CGPoint
        if(op == .draw){
            if(shape_flag == 0){
                (currentShape as! Square).width = abs(touchPoint.x - (currentShape?.origin)!.x)
                (currentShape as! Square).height = abs(touchPoint.y - (currentShape?.origin)!.y)
            }
            else if(shape_flag == 1){
                let distance = Functions.distance(a: touchPoint, b: (currentShape?.origin)!)
                (currentShape as! Circle).radius = distance
            }
            else{
                let distance = Functions.distance(a: touchPoint, b: (currentShape?.origin)!)
                (currentShape as! Triangle).radius = distance
            }
            
            let size = Canvas.items.count
            Canvas.items[size - 1] = currentShape!
        }
        else if(op == .move){
            if(ith != -1){
                (Canvas.items[ith] as! Shape).move(p1: touch_begin, p2: touchPoint)
                touch_begin = touchPoint
                Canvas.items[ith] = Canvas.items[ith]
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        ith = -1
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
    shouldRecognizeSimultaneouslyWith otherGestureRecognizer:
    UIGestureRecognizer) -> Bool {
        true
    }
}
