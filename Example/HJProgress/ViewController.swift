//
//  ViewController.swift
//  HJProgress
//
//  Created by Mr.Heng on 04/26/2022.
//  Copyright (c) 2022 Mr.Heng. All rights reserved.
//

import HJProgress
import CoreGraphics

class ViewController: UIViewController {

    
    // MARK: - 1.interface
    
    // MARK: - 2.lift cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(viewProgress1)
        view.addSubview(viewProgress2)
        view.addSubview(viewProgress3)
        view.addSubview(viewProgress4)
        view.addSubview(viewProgress5)
        view.addSubview(viewProgress6)
        view.addSubview(viewProgress7)
        view.addSubview(viewProgress8)
        view.addSubview(viewProgress9)
        
        view.addSubview(buttonStart)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - 3.private methods
    
    // MARK: - 4.event response
    @objc func start() {
        viewProgress1.progress = 0.8
        viewProgress2.progress = 0.8
        viewProgress3.progress = 0.8
        viewProgress4.progress = 0.8
        viewProgress5.progress = 0.8
        viewProgress6.progress = 0.8
        viewProgress7.progress = 0.8
        viewProgress9.progress = 0.8
    }
    // MARK: - 5.getter
    private lazy var viewProgress1: HJProgress = {
        let newView = HJProgress(frame: CGRect(x: 0, y: 100, width: view.bounds.width, height: 5))
        newView.type = .line

        var data = HJData()
        data.backColor = .green
        data.progressColor = .red
        data.lineWidth = 2
        data.lineDashPattern = [12, 4]
        newView.data = data
        return newView
    }()

    private lazy var viewProgress2: HJProgress = {
        let newView = HJProgress(frame: CGRect(x: 10, y: 110, width: 120, height: 120))
        newView.type = .circle

        var data = HJData()
        data.realWidth = 120
        data.lineWidth = 2
        newView.data = data
        return newView
    }()

    private lazy var viewProgress3: HJProgress = {
        let newView = HJProgress(frame: CGRect(x: view.bounds.width - 130, y: 110, width: 120, height: 120))
        newView.type = .circle

        var data = HJData()
        data.realWidth = 120
        data.lineWidth = 2
        data.startAngle = 0.8 * .pi
        data.endAngle = 0.2 * .pi
        newView.data = data
        return newView
    }()

    private lazy var viewProgress4: HJProgress = {
        let newView = HJProgress(frame: CGRect(x: 10, y: 240, width: 120, height: 120))
        newView.type = .circle

        var data = HJData()
        data.isGradient = true
        data.realWidth = 120
        data.lineWidth = 2
        newView.data = data
        return newView
    }()

    private lazy var viewProgress5: HJProgress = {
        let newView = HJProgress(frame: CGRect(x: view.bounds.width - 130, y: 240, width: 120, height: 120))
        newView.type = .circle

        var data = HJData()
        data.isGradient = true
        data.realWidth = 120
        data.lineWidth = 2
        data.startAngle = 0.8 * .pi
        data.endAngle = 0.2 * .pi
        newView.data = data
        return newView
    }()
    
    private lazy var viewProgress6: HJProgress = {
        let newView = HJProgress(frame: CGRect(x: 10, y: 370, width: 120, height: 120))
        newView.type = .circle
        newView.viewDot = viewDot6
        
        var data = HJData()
        data.isGradient = true
        data.realWidth = 110
        data.lineWidth = 2
        newView.data = data
        return newView
    }()
     
    private lazy var viewProgress7: HJProgress = {
        let newView = HJProgress(frame: CGRect(x: view.bounds.width - 130, y: 370, width: 120, height: 120))
        newView.type = .circle
        newView.viewDot = viewDot7
        
        var data = HJData()
        data.isGradient = true
        data.realWidth = 110
        data.lineWidth = 2
        data.startAngle = -0.2 * .pi
        data.endAngle = -0.5 * .pi
        newView.data = data
        return newView
    }()
    
    private lazy var viewDot6: UIView = {
        let newView = UIView()
        newView.frame.size = CGSize(width: 10, height: 10)
        
        newView.backgroundColor = .purple
        
        return newView
    }()
    
    private lazy var viewDot7: UIView = {
        let newView = UIView()
        newView.frame.size = CGSize(width: 10, height: 10)
        
        newView.backgroundColor = .orange

        newView.layer.masksToBounds = true
        newView.layer.cornerRadius = 5
        
        return newView
    }()
    
    private lazy var viewProgress8: HJProgress = {
        let newView = HJProgress(frame: CGRect(x: 10, y: 500, width: 120, height: 120))
        newView.type = .lineCircle
        
        var data = HJData()
        data.backColor = .green
        data.isGradient = true
        data.realWidth = 110
        data.lineWidth = 10
         
        let circle = 50 * 2 * CGFloat.pi
        let space = circle / 60.0 / 3.0
        data.lineDashPattern = [NSNumber(floatLiteral: space), NSNumber(floatLiteral: space * 2)]
        
        newView.data = data
        return newView
    }()
     
    private lazy var viewProgress9: HJProgress = {
        let newView = HJProgress(frame: CGRect(x: view.bounds.width - 130, y: 500, width: 120, height: 120))
        newView.type = .lineCircle
        
        var data = HJData()
        data.backColor = .green
        data.isGradient = true
        data.realWidth = 110
        data.lineWidth = 10
        
        let circle = 50 * 2 * CGFloat.pi
        let space = circle / 60.0 / 3.0
        data.lineDashPattern = [NSNumber(floatLiteral: space), NSNumber(floatLiteral: space * 2)]
        newView.data = data
        return newView
    }()
    
    private lazy var buttonStart: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: view.bounds.width/2 - 40, y: view.bounds.height - 100, width: 80, height: 40)
        button.backgroundColor = .gray
        button.setTitle("开始", for: .normal)
        button.addTarget(self, action: #selector(start), for: .touchUpInside)
        return button
    }()
}

