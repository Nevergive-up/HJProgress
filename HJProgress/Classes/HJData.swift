//
//  HJData.swift
//  HJProgress
//
//  Created by yl on 2022/4/27.
//

import UIKit

public class HJData: NSObject {
    ///背景颜色
    public var backColor: UIColor = .gray
    ///进度条颜色
    public var progressColor: UIColor = .red
    ///线宽
    public var lineWidth: CGFloat = 2.0
     
    ///线间距 间断进度条专属  直线计算长度，圆计算周长
    public var lineDashPattern: [NSNumber] = [15 , 5]
       
    ///圆直径
    public var realWidth: CGFloat = 100
    ///圆起点角度。角度从水平右侧开始为0，顺时针为增加角度。直接传度数 如-90
    public var startAngle: CGFloat = 0.5 * .pi
    ///圆结束角度。角度从水平右侧开始为0，顺时针为增加角度。直接传度数 如-90
    public var endAngle: CGFloat = 0.5 * .pi
    ///动画时长
    public var duration: CGFloat = 2
    
    
    ///是否开启渐变 默认false
    public var isGradient: Bool = false
    ///渐变颜色
    public var colors: [CGColor] = [UIColor.red.cgColor, UIColor.green.cgColor]
    ///渐变色位置
    public var locations: [NSNumber] = [0, 1]
    ///渐变色起始位置
    public var startPoint: CGPoint = CGPoint(x: 0, y: 0)
    ///渐变色结束位置
    public var endPoint: CGPoint = CGPoint(x: 1, y: 0)
    
    
    public override init() {
        super.init()
    }
}



