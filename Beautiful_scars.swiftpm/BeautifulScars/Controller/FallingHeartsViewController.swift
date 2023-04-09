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
    
    func collisionBehavior(
        _ behavior: UICollisionBehavior,
        beganContactFor item: UIDynamicItem,
        withBoundaryIdentifier identifier: NSCopying?,
        at point: CGPoint) {
            (item as? UIView)?.frame = CGRect(
                x: item.bounds.midX,
                y: item.bounds.midY,
                width: 0,
                height: 0)
        }
    
    func collisionBehavior(
        _ behavior: UICollisionBehavior,
        endedContactFor item: UIDynamicItem,
        withBoundaryIdentifier identifier: NSCopying?) {
            guard let screen = self.screen else {
                return
            }
            
            guard let imagemView: UIImageView = item as? UIImageView else {
                return
            }
            let brokenHeart: UIImage? = UIImage(named: "broken_heart")
            if brokenHeart ==  imagemView.image {
                collectedHeartsCounter += 1
            }
            
            
            if collectedHeartsCounter >= limiteCounter {
                print("Aqui vc faz dps, para o looping e coloca o popup")
            }
            print(collectedHeartsCounter)
            screen.collision.removeItem(item)
        }
}
