//
//  HJBottomView.swift
//  HJProgress
//
//  Created by yl on 2022/4/27.
//

import UIKit

class HJBottomView: UIView {
    
    // MARK: - 1.interface
    ///半径
    private var radius: CGFloat = 0
    ///数据
    var data: HJData = HJData() {
        didSet {
            radius = data.realWidth / 2 - data.lineWidth
            layer.addSublayer(backLayer)
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
        let bezierPath = UIBezierPath(arcCenter: CGPoint(x: data.realWidth/2, y: data.realWidth/2),
                                      radius: radius,
                                      startAngle: data.startAngle,
                                      endAngle: 2 * .pi + data.endAngle,
                                      clockwise: true)
        return bezierPath
    }()
    ///背景圆环
    private lazy var backLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.frame         = bounds
        layer.fillColor     = UIColor.clear.cgColor
        layer.lineWidth     = data.lineWidth
        layer.strokeColor   = data.backColor.cgColor
        layer.lineCap       = .round
        layer.path          = path.cgPath
        return layer
    }()
}




