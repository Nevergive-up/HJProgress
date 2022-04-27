//
//  HJProgress.swift
//  HJProgress
//
//  Created by yl on 2022/4/26.
//

import UIKit

public enum HJProgressType {
    ///连续线
    case line
    ///圆形进度条
    case circle
    ///渐变
    case gradient
    ///圆环
    case lineCircle
}

public class HJProgress: UIView {
 
    // MARK: - 1.interface
    ///类型
    public var type: HJProgressType? {
        didSet {
            removeFromSuperview()
            switch type {
            case .line:
                addSubview(lineProgress)
            case .circle, .gradient:
                addSubview(viewBottom)
                addSubview(viewCircle)
            case .lineCircle:
                addSubview(viewLine)
            default:
                break
            }
        }
    }
    ///数据
    public var data: HJData = HJData() {
        didSet {
            switch type {
            case .line:
                lineProgress.data   = data
            case .circle:
                viewBottom.data     = data
                viewCircle.data     = data
            case .lineCircle:
                viewLine.data       = data
            default:
                break
            }
        }
    }
    ///进度
    public var progress: CGFloat = 0.0 {
        didSet {
            switch type {
            case .line:
                lineProgress.progress   = progress
            case .circle:
                viewCircle.progress     = progress
            case .lineCircle:
                viewLine.progress       = progress
            default:
                break
            }
        }
    }
    ///添加之后，进度条终点出现 view
    public var viewDot: UIView? {
        didSet {
            if type != .line {
                viewCircle.viewDot = viewDot
            }
        }
    }
    // MARK: - 2.lift cycle
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - 3.private methods
    
    // MARK: - 4.event response
    
    // MARK: - 5.getter
    ///直线进度条
    private lazy var lineProgress: HJProgressLineView = {
        let newView = HJProgressLineView(frame: bounds)
        return newView
    }()
    ///底部圆环
    private lazy var viewBottom: HJBottomView = {
        let newView = HJBottomView(frame: bounds)
        return newView
    }()
    ///圆环进度条
    private lazy var viewCircle: HJCircleView = {
        let newView = HJCircleView(frame: bounds)
        return newView
    }()
    ///仪表盘
    private lazy var viewLine: HJLineCircleView = {
        let newView = HJLineCircleView(frame: bounds)
        return newView
    }()
}
