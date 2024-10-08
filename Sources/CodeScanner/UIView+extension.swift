//
//  File.swift
//
//
//  Created by Разработчик on 08.10.2024.
//

import UIKit


extension UIView {
    func addRoundedCornerBorder(size: CGFloat, cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: UIColor) {
        self.layer.sublayers?.filter { $0 is CAShapeLayer }.forEach { $0.removeFromSuperlayer() }
        
        let borderLayer = CAShapeLayer()
        let path = UIBezierPath()
        
        // left top
        path.move(to: CGPoint(x: 0, y: size / 4))
        path.addLine(to: CGPoint(x: 0, y: cornerRadius))
        path.addArc(withCenter: CGPoint(x: cornerRadius, y: cornerRadius), radius: cornerRadius, startAngle: .pi, endAngle: .pi * 1.5, clockwise: true)
        path.addLine(to: CGPoint(x: size / 4, y: 0))
        
        // right top
        path.move(to: CGPoint(x: size - size / 4, y: 0))
        path.addLine(to: CGPoint(x: size - cornerRadius, y: 0))
        path.addArc(withCenter: CGPoint(x: size - cornerRadius, y: cornerRadius), radius: cornerRadius, startAngle: .pi * 1.5, endAngle: 0, clockwise: true)
        path.addLine(to: CGPoint(x: size, y: size / 4))
        
        // right bottom
        path.move(to: CGPoint(x: size, y: size - size / 4))
        path.addLine(to: CGPoint(x: size, y: size - cornerRadius))
        path.addArc(withCenter: CGPoint(x: size - cornerRadius, y: size - cornerRadius), radius: cornerRadius, startAngle: 0, endAngle: .pi * 0.5, clockwise: true)
        path.addLine(to: CGPoint(x: size - size / 4, y: size))
        
        // left bottom
        path.move(to: CGPoint(x: size / 4, y: size))
        path.addLine(to: CGPoint(x: cornerRadius, y: size))
        path.addArc(withCenter: CGPoint(x: cornerRadius, y: size - cornerRadius), radius: cornerRadius, startAngle: .pi * 0.5, endAngle: .pi, clockwise: true)
        path.addLine(to: CGPoint(x: 0, y: size - size / 4))
        
        borderLayer.path = path.cgPath
        borderLayer.strokeColor = borderColor.cgColor
        borderLayer.lineWidth = borderWidth
        borderLayer.fillColor = UIColor.clear.cgColor
        
        self.layer.addSublayer(borderLayer)
    }
}
