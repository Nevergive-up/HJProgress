//
//  HJCircleView.swift
//  HJProgress
//
//  Created by yl on 2022/4/26.
//

import UIKit

class HJCircleView: UIView {
 
    // MARK: - 1.interface
    ///半径
    private var radius: CGFloat = 0
    ///数据
    var data: HJData = HJData() {
        didSet {
            radius = data.realWidth / 2 - data.lineWidth
            
            if data.isGradient {
                gradientLayer.mask = progressLayer
                layer.addSublayer(gradientLayer)
            } else {
                layer.addSublayer(progressLayer)
            }
            if let dot = viewDot {
                addSubview(dot)
                dot.isHidden = true
            }
        }
    }
    ///进度
    public var progress: CGFloat = 0.0 {
        didSet {
            CATransaction.begin()
            CATransaction.setDisableActions(false)
            CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: .linear))
            CATransaction.setAnimationDuration(data.duration)
            progressLayer.strokeEnd = progress
            CATransaction.commit()
                 
            if let dot = viewDot {
                dot.isHidden = false
                dot.layer.add(pointAnimation, forKey: "pointAnimation")
            }
        }
    }
    ///进度条圆点
    public var viewDot: UIView?
    
    // MARK: - 2.lift cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 3.private methods
    
    // MARK: - 4.event response
    
    // MARK: - 5.getter
    ///贝塞尔直线
    private lazy var path: UIBezierPath = {
        let bezierPath = UIBezierPath(arcCenter: CGPoint(x: data.realWidth/2, y: data.realWidth/2),
                                      radius: radius,
                                      startAngle: data.startAngle,
                                      endAngle: 2 * .pi + data.endAngle,
                                      clockwise: true)
        return bezierPath
    }()
    ///进度圆环
    private lazy var progressLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.frame         = bounds
        layer.fillColor     = UIColor.clear.cgColor
        layer.lineWidth     = data.lineWidth
        layer.strokeColor   = data.progressColor.cgColor
        layer.lineCap       = .round
        layer.path          = path.cgPath
        layer.strokeEnd     = 0
        return layer
    }()
    
    ///渐变背景
    private lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.frame = bounds
        layer.colors = data.colors
        layer.locations = data.locations
        layer.startPoint = data.startPoint
        layer.endPoint = data.endPoint
        return layer
    }()
    
    private lazy var pointAnimation: CAAnimation = {
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.fillMode = .forwards
        animation.calculationMode = CAAnimationCalculationMode.paced
        animation.isRemovedOnCompletion = false
        animation.duration = data.duration
        animation.delegate = self
        
        var end = 2 * .pi * progress + data.startAngle
        if data.startAngle != data.endAngle {
            end = (2 * .pi - CGFloat(fabs(Double(data.endAngle))) - data.startAngle) * progress + data.startAngle
        }
        
        let imagePath = UIBezierPath(arcCenter: CGPoint(x: data.realWidth/2, y: data.realWidth/2),
                                     radius: radius,
                                     startAngle: data.startAngle,
                                     endAngle: end,
                                     clockwise: true)
        animation.path = imagePath.cgPath
        return animation
    }()
}

extension HJCircleView: CAAnimationDelegate {
    
}




