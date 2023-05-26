//
//  CircleProgressView.swift
//  
//
//  Created by Serhii Horinenko on 11.05.2023.
//

import UIKit

public class CircleProgressView: UIView {

    private enum Constants {
        static let progressMargin = CGFloat(1)
    }

    // MARK: - Public properties

    @IBInspectable
    public var progressColor: UIColor = .white
    {
        didSet {
            progressLayer.strokeColor = progressColor.cgColor
        }
    }

    @IBInspectable
    public var trackColor: UIColor = .white
    {
        didSet {
            trackLayer.strokeColor = trackColor.cgColor
        }
    }

    @IBInspectable
    var lineWidth: CGFloat = 1
    {
        didSet {
            trackLayer.lineWidth = CGFloat(lineWidth)
        }
    }

    @IBInspectable
    var progress: Double = 0.3
    {
        didSet {
//            trackLayer.lineWidth = CGFloat(lineWidth)
        }
    }

    // MARK: - Private properties

    private var currWidth = CGFloat(0)
    private let progressLayer = CAShapeLayer()
    private let trackLayer = CAShapeLayer()

    // MARK: - Public methods

    public override func awakeFromNib() {
        super.awakeFromNib()
        layer.insertSublayer(progressLayer, at: 0)
        layer.insertSublayer(trackLayer, at: 0)
    }

    public override func draw(_ rect: CGRect) {

    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        if currWidth != bounds.width {
            currWidth = bounds.width
            reloadLayers()
        }
    }

    // MARK: - Private methods

    private func reloadLayers() {
        let radius = floor(frame.size.width / 2)
        backgroundColor = .clear

        let circlePath = UIBezierPath(arcCenter: CGPoint(x: radius, y: radius),
                                      radius: radius,
                                      startAngle: 0,
                                      endAngle: CGFloat(2 * Double.pi),
                                      clockwise: true)
        trackLayer.path = circlePath.cgPath
        trackLayer.fillColor = trackColor.cgColor
        trackLayer.strokeColor = trackColor.cgColor
//        trackLayer.lineWidth = CGFloat(lineWidth)
//        trackLayer.strokeEnd = 1
//        layer.addSublayer(trackLayer)

        let progressPath = UIBezierPath(arcCenter: CGPoint(x: radius, y: radius),
                                        radius: radius - Constants.progressMargin - floor(lineWidth / 2),
                                        startAngle: -Double.pi / 2,
                                        endAngle: -Double.pi / 2 + 2 * Double.pi * progress,
                                        clockwise: true)
        progressLayer.path = progressPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = progressColor.cgColor
        progressLayer.lineWidth = CGFloat(lineWidth)
//        progressLayer.strokeEnd = 1
//        layer.addSublayer(progressLayer)
    }

}
