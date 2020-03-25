//
//  TestView.swift
//  ManualPositioning
//
//  Created by Shawn Gee on 3/24/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

@IBDesignable
class TestView: UIView {

    // Views
    private let containerView = UIView()
    private let redSquare = UIView()
    private let redSquareSize = CGSize(width: 100, height: 100)
    private let topLabel = UILabel()
    
    private let frameLabel = UILabel()
    private let boundsLabel = UILabel()
    
    
    override func layoutSubviews() {
        containerView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
        redSquare.frame = CGRect(origin: CGPoint.zero, size: redSquareSize)
        topLabel.frame = CGRect(x:0, y: 0, width: 100, height: 20)


        // Play with redSquare's frame
        //redSquare.frame = CGRect(origin: CGPoint(x: 50, y: 50), size: redSquareSize)


        // Play with redSquare's transform
        redSquare.transform = .init(translationX: 50, y: 50)
        redSquare.transform = redSquare.transform.rotated(by: .pi)
        
        //redSquare.transform = .identity

        // Play with redSquare's bounds
        //redSquare.bounds = CGRect(x: 30, y: 0, width: 100, height: 100)


        // Play with containerView's color
        


        frameLabel.frame = CGRect(x: 0, y: frame.width, width: frame.width, height: 50)
        frameLabel.text = "  redSquare's Frame: \(redSquare.frame)"
        boundsLabel.frame = CGRect(x: 0, y: frame.width + 50, width: frame.width, height: 50)
        boundsLabel.text = "  redSquare's Bounds: \(redSquare.bounds)"
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.translateBy(x: 0, y: frame.height * 0.7)
        
        context.move(to: CGPoint(x: 10, y: 0))
        context.addLine(to: CGPoint(x: 10, y: 50))
        context.addLine(to: CGPoint(x: 40, y: 75))
        context.addLine(to: CGPoint(x: 70, y: 50))
        context.addLine(to: CGPoint(x: 70, y: 0))
        context.addLine(to: CGPoint(x: 10, y: 0))
        
//        context.setStrokeColor(UIColor.red.cgColor)
//        context.strokePath()
        
        context.setFillColor(UIColor.red.cgColor)
        context.fillPath()
    }
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - Setup
    
    private func setup() {
        // Add container
        addSubview(containerView)
        containerView.backgroundColor = .lightGray
        
        // Add red square to container
        containerView.addSubview(redSquare)
        redSquare.backgroundColor = .red
        
        redSquare.addSubview(topLabel)
        topLabel.text = "TOP"
        topLabel.textAlignment = .center
        
        // Labels
        addSubview(frameLabel)
        addSubview(boundsLabel)
        
        frameLabel.numberOfLines = 0
        boundsLabel.numberOfLines = 0
    }
}
