//
//  HJProgressLineView.swift
//  HJProgress
//
//  Created by yl on 2022/4/26.
//

import UIKit

class HJProgressLineView: UIView {
    
    // MARK: - 1.interface
    ///数据
    var data: HJData = HJData() {
        didSet {
            layer.addSublayer(backLayer)
            layer.addSublayer(progressLayer)
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
        }
    }
    
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
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0, y: 0))
        bezierPath.addLine(to: CGPoint(x: bounds.size.width, y: 0))
        return bezierPath
    }()
    ///背景线
    private lazy var backLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = data.backColor.cgColor
        layer.lineWidth = data.lineWidth
        layer.lineDashPattern = data.lineDashPattern
        layer.path = path.cgPath
        return layer
    }()
    ///进度条线
    private lazy var progressLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = data.progressColor.cgColor
        layer.lineWidth = data.lineWidth
        layer.lineDashPattern = data.lineDashPattern
        layer.strokeStart = 0
        layer.strokeEnd = 0
        layer.path = path.cgPath
        return layer
    }()
}
