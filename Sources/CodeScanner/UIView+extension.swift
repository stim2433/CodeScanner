//
//  File.swift
//  
//
//  Created by Разработчик on 08.10.2024.
//

import UIKit


extension UIView {
    func addRoundedCornerBorder(cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: UIColor) {
            self.layer.sublayers?.filter { $0 is CAShapeLayer }.forEach { $0.removeFromSuperlayer() }
            
            let borderLayer = CAShapeLayer()
            let path = UIBezierPath()
            
            path.move(to: CGPoint(x: cornerRadius, y: 0))
            path.addArc(withCenter: CGPoint(x: cornerRadius, y: cornerRadius), radius: cornerRadius, startAngle: .pi, endAngle: .pi * 1.5, clockwise: true)
            
            path.addLine(to: CGPoint(x: self.bounds.width - cornerRadius, y: 0)) // right top
            path.addArc(withCenter: CGPoint(x: self.bounds.width - cornerRadius, y: cornerRadius), radius: cornerRadius, startAngle: .pi * 1.5, endAngle: 0, clockwise: true)
//            
//            path.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height - cornerRadius)) // right bottom
//            path.addArc(withCenter: CGPoint(x: self.bounds.width - cornerRadius, y: self.bounds.height - cornerRadius), radius: cornerRadius, startAngle: 0, endAngle: .pi * 0.5, clockwise: true)
//            
//            path.addLine(to: CGPoint(x: cornerRadius, y: self.bounds.height)) // left bottom Нижняя
//            path.addArc(withCenter: CGPoint(x: cornerRadius, y: self.bounds.height - cornerRadius), radius: cornerRadius, startAngle: .pi * 0.5, endAngle: .pi, clockwise: true)
            
            path.close()
            
            borderLayer.path = path.cgPath
            borderLayer.strokeColor = borderColor.cgColor
            borderLayer.lineWidth = borderWidth
            borderLayer.fillColor = UIColor.clear.cgColor
            
            self.layer.addSublayer(borderLayer)
        }
}
