//
//  FallingHeartsViewController.swift
//
//
//  Created by Sarah Madalena on 04/04/23.
//

import Foundation
import UIKit
import SwiftUI

class FallingHeartsViewCoordinator: NSObject, UICollisionBehaviorDelegate {
    var screen: FallingHearts?
    var collectedHeartsPercentage = 0
    var collectedHeartsCounter = 0
    let limiteCounter: Int = 10
    var didCollectBrokenHeart: ((CGFloat) -> Void)?
    var heartToCollect: Heart
    
    init(
        screen: FallingHearts? = nil,
        collectedHeartsPercentage: Int = 0,
        collectedHeartsCounter: Int = 0,
        didCollectBrokenHeart: ((CGFloat) -> Void)? = nil,
        heartToCollect: Heart = .broken
    ) {
        self.screen = screen
        self.collectedHeartsPercentage = collectedHeartsPercentage
        self.collectedHeartsCounter = collectedHeartsCounter
        self.didCollectBrokenHeart = didCollectBrokenHeart
        self.heartToCollect = heartToCollect
    }
    
    func collisionBehavior(
        _ behavior: UICollisionBehavior,
        beganContactFor item: UIDynamicItem,
        withBoundaryIdentifier identifier: NSCopying?,
        at point: CGPoint) {
            guard let screen = self.screen else { return }
            guard let imagemView: UIImageView = item as? UIImageView else { return }
            let heart: UIImage? = heartToCollect == Heart.broken ?
                UIImage(named: "broken_heart"):
                UIImage(named: "heart")
            
            if heart ==  imagemView.image {
                collectedHeartsCounter += 1
                didCollectBrokenHeart?(CGFloat(collectedHeartsCounter))
            }

            screen.collision.removeItem(item)
            imagemView.removeFromSuperview()
        }
}
