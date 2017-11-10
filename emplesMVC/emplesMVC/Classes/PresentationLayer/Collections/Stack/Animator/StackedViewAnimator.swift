//
//  StackedViewAnimator.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import ZLSwipeableView

class StackedViewAnimator : NSObject, ZLSwipeableViewAnimator {
    func animate(_ view: UIView!, index: UInt, views: [UIView]!, swipeableView: ZLSwipeableView!) {
        let degree = sin(0.5 * Double(index))
        let duration = 0.4
        let offset = CGPoint(x:0, y:swipeableView.bounds.height * 0.3)
        let translation = CGPoint(x:degree * 10.0, y:-(Double(index) * 5.0))
        
        self.rotateAndTranslate(view, degree: CGFloat(degree), translation: translation, duration: duration, at: offset, swipeableView: swipeableView)
        
    }
    
    private func rotateAndTranslate(_ view:UIView, degree:CGFloat, translation:CGPoint, duration:TimeInterval, at offset:CGPoint, swipeableView: ZLSwipeableView!) {
        
        let rotationRadian = self.degreesToRadians(degree)
        UIView .animate(withDuration: duration, delay: 0, options: .allowUserInteraction, animations: {
            
            view.center = swipeableView.convert(swipeableView.center, from: swipeableView.superview)
            
            let transform = CGAffineTransform(translationX: offset.x, y: offset.y)
                .rotated(by: rotationRadian)
                .translatedBy(x: -offset.x, y: -offset.y)
                .translatedBy(x: translation.x, y: translation.y)
            view.transform = transform;
        })
    }
    
    private func degreesToRadians(_ degree: CGFloat) -> CGFloat {
        return degree * CGFloat.pi/180
    }
    
}
