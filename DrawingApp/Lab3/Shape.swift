//
//  Shape.swift
//  CSE 438S Lab 3
//
//  Created by Michael Ginn on 5/31/21.
//

import UIKit

/**
 YOU SHOULD MODIFY THIS FILE.
 
 Feel free to implement it however you want, adding properties, methods, etc. Your different shapes might be subclasses of this class, or you could store information in this class about which type of shape it is. Remember that you are partially graded based on object-oriented design. You may ask TAs for an assessment of your implementation.
 */

/// A `DrawingItem` that draws some shape to the screen.
class Shape: DrawingItem {
    var origin:CGPoint
    var color:UIColor
    var path = UIBezierPath()
    var scale:CGFloat = 1.0
    var angle:CGFloat = 0
    
    public required init(origin: CGPoint, color: UIColor){
        self.origin = origin
        self.color = color
    }
    
    func draw() {
        fatalError("IMPLEMENT THIS")
    }
    
    func contains(point: CGPoint) -> Bool {
        return path.contains(point)
    }
    
    func move(p1: CGPoint, p2: CGPoint){
        origin = CGPoint(x: origin.x + p2.x - p1.x, y: origin.y + p2.y - p1.y)
    }
    
    func resize(r: CGFloat){
        scale = r
    }
    
    func rotate(a: CGFloat){
        angle = a
    }
}

class Circle: Shape{
    var radius: CGFloat
    
    public required init(origin: CGPoint, color: UIColor, radius: CGFloat) {
        self.radius = radius
        super.init(origin: origin, color: color)
    }
    
    public required init(origin: CGPoint, color: UIColor) {
        fatalError("init(origin:color:) has not been implemented")
    }
    
    override func draw(){
        path.removeAllPoints()
        color.setFill()
        path.addArc(withCenter: self.origin, radius: radius, startAngle: 0, endAngle: CGFloat(Float.pi * 2), clockwise: true)
        path.resize(by: scale)
        path.rotate(by: angle)
        path.fill()
        color.setStroke()
        path.stroke()
    }
    
}

extension UIBezierPath {
    func resize(by scale: CGFloat){
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        var transform = CGAffineTransform.identity
        transform = transform.translatedBy(x: center.x, y: center.y)
        transform = transform.scaledBy(x: scale, y: scale)
        transform = transform.translatedBy(x: -center.x, y: -center.y)
        self.apply(transform)
    }
    
    func rotate(by angleRadians: CGFloat){
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        var transform = CGAffineTransform.identity
        transform = transform.translatedBy(x: center.x, y: center.y)
        transform = transform.rotated(by: angleRadians)
        transform = transform.translatedBy(x: -center.x, y: -center.y)
        self.apply(transform)
    }
}
