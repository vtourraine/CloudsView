//
// CloudsView.swift
//
// Copyright (c) 2018 Vincent Tourraine (http://www.vtourraine.net)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


import UIKit

@available(iOS 10.0, *)
class CloudsView: UIView {

    static let SpawnTimeInterval: TimeInterval = 10
    static let HorizontalRandomMaxOverflow: CGFloat = 200
    static let CloudSize: CGSize = CGSize(width: 84, height: 54)
    static let AnimationDuration: TimeInterval = 50
    var animationTimer: Timer?

    func startAnimation() {
        guard animationTimer == nil else {
            return
        }

        spawnBunchOfCloudsInTheSky()
        spawnCloudFromTheSide()

        animationTimer = Timer.scheduledTimer(withTimeInterval: CloudsView.SpawnTimeInterval, repeats: true) { (timer) in
            self.spawnCloudFromTheSide()
        }
    }

    override func removeFromSuperview() {
        super.removeFromSuperview()

        if let animationTimer = animationTimer {
            animationTimer.invalidate()
        }
    }

    func spawnBunchOfCloudsInTheSky() {
        let InitialNumberOfClouds = Int.random(in: 2...3)

        for _ in 0..<InitialNumberOfClouds {
            spawnCloudInTheSky()
        }
    }

    func spawnCloudInTheSky() {
        spawnCloud(x: CGFloat.random(in: 0..<self.bounds.size.width))
    }

    func spawnCloudFromTheSide() {
        spawnCloud(x: CGFloat.random(in: -CloudsView.HorizontalRandomMaxOverflow..<0))
    }

    func spawnCloud(x: CGFloat) {
        let y = CGFloat.random(in: (CloudsView.CloudSize.height / 2)..<(self.bounds.size.height - CloudsView.CloudSize.height / 2))

        spawnCloud(origin: CGPoint(x: x, y: y))
    }

    func spawnCloud(origin: CGPoint) {
        let imageView = UIImageView(image: UIImage(named: "Cloud"))
        imageView.tintColor = .white
        imageView.alpha = 0.7
        imageView.frame = CGRect(origin: .zero, size: CloudsView.CloudSize)
        imageView.center = origin
        addSubview(imageView)

        let boundsWidth = self.bounds.size.width
        UIView.animate(withDuration: CloudsView.AnimationDuration, delay: 0, options: .curveLinear, animations: {
            imageView.center = CGPoint(x: origin.x + boundsWidth + CloudsView.CloudSize.width + CloudsView.HorizontalRandomMaxOverflow, y: origin.y)
        }) { (completed) in
            if completed {
                imageView.removeFromSuperview()
            }
        }
    }
}
