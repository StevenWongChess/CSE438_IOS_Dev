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
    var internal_scale:CGFloat = 1.0
    var internal_angle:CGFloat = 0
    
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
    
    func resize_end(){
        internal_scale *= scale
    }
    
    func rotate(a: CGFloat){
        angle = a
    }
    
    func rotate_end(){
        internal_angle += angle
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
        path.resize(by: scale * internal_scale)
        path.rotate(by: angle + internal_angle)
        path.fill()
        color.setStroke()
        path.stroke()
    }
    
}

class Square: Shape{
    var width:CGFloat
    var height:CGFloat
    public required init(origin: CGPoint, color: UIColor, width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
        super.init(origin: origin, color: color)
    }
    
    public required init(origin: CGPoint, color: UIColor) {
        fatalError("init(origin:color:) has not been implemented")
    }
    
    override func draw(){
        path.removeAllPoints()
        color.setFill()
        path.move(to: CGPoint(x: origin.x + width, y: origin.y + height))
        path.addLine(to: CGPoint(x: origin.x + width, y: origin.y - height))
        path.addLine(to: CGPoint(x: origin.x - width, y: origin.y - height))
        path.addLine(to: CGPoint(x: origin.x - width, y: origin.y + height))
        path.close()
        path.resize(by: scale * internal_scale)
        path.rotate(by: angle + internal_angle)
        path.fill()
        color.setStroke()
        path.stroke()
    }
}

class Triangle:Shape{
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
        path.move(to: CGPoint(x: origin.x + radius * sin(CGFloat(Float.pi) / 3), y: origin.y + radius * 0.5))
        path.addLine(to: CGPoint(x: origin.x - radius * sin(CGFloat(Float.pi) / 3), y: origin.y + radius * 0.5))
        path.addLine(to: CGPoint(x: origin.x, y: origin.y - radius))
            
        path.close()
        path.resize(by: scale * internal_scale)
        path.rotate(by: angle + internal_angle)
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
