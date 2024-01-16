//
//  FallingHeartsView.swift
//  
//
//  Created by Sarah Madalena on 04/04/23.
//

import Foundation
import UIKit
import SwiftUI

struct FallingHeartsView: UIViewRepresentable {
    @Binding var pause: Bool
    @Binding var progress: CGFloat
    @State var coordinator = FallingHeartsViewCoordinator()
    var heartToCollect: Heart
    
    func makeUIView(context: Context) -> UIView {
        let screen = FallingHearts(heartToCollect: heartToCollect)
        context.coordinator.screen = screen
        screen.collision.collisionDelegate = context.coordinator
        screen.timer.fire()
        return screen
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        if !pause {
            _ = uiView as! FallingHearts
        }
    }
    
    func didCollectHeart(_ value: CGFloat) {
        progress += 1
        if progress >= 8 { coordinator.screen?.finishDrop() }
    }
    
    func makeCoordinator() -> FallingHeartsViewCoordinator {
        coordinator.didCollectBrokenHeart = didCollectHeart
        coordinator.heartToCollect = heartToCollect
        return coordinator
    }
}

class FallingHearts: UIView {
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    var heartToCollect: Heart
    
    let background: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "fundo_heart")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var timer = Timer.scheduledTimer(
        timeInterval: 1.0,
        target: self,
        selector: #selector(dropHeart),
        userInfo: nil,
        repeats: true
    ) //tempo de queda do coracao
    
    lazy var pote: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Pote")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }() //responsavel pela posicao do pote
    
    var actionWhenPhaseOver: (() -> Void)?
    var hearts: [UIImageView] = [UIImageView]()
    
    init(heartToCollect: Heart) {
        self.heartToCollect = heartToCollect
        super.init(frame: .zero)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(pannedView))
        pote.addGestureRecognizer(panGesture) //reconhece o movimento do gesture
        pote.isUserInteractionEnabled = true //habilita o movimento
        
        self.backgroundColor = .white
        self.addSubview(background)
        self.addSubview(pote)
        
        setConstraints()
    
        animator = UIDynamicAnimator(referenceView: self)
        gravity = UIGravityBehavior(items: [])
        collision = UICollisionBehavior(items: [])
        
        addGravityBehavior()
        addCollisionBehavior()
    }
    
    @objc
    func dropHeart() {
        let heart = newHeart()
        self.collision.addItem(heart)
        self.gravity.addItem(heart)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            background.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            background.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            background.topAnchor.constraint(equalTo: self.topAnchor),
            
            pote.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            pote.widthAnchor.constraint(equalToConstant: 150),
            pote.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    @objc
    func addGravityBehavior() {
        let direction = CGVector(dx: 0, dy: 1)
        gravity.gravityDirection = direction
        gravity.magnitude = 0.25
        animator.addBehavior(gravity)
    }
    
    func addCollisionBehavior() {
        collision.addBoundary(withIdentifier: "Pote" as NSString, for: UIBezierPath(rect: pote.frame))
        animator.addBehavior(collision)
    }
    
    func newHeart() -> UIImageView {
        let heartIcon = UIImageView(
            frame: CGRect(
                x: Int.random(in: 150..<Int(UIScreen.main.bounds.width * 0.8)),
                y: 205,
                width: 70,
                height: 70
            )
        )
        let iconNumber = Int.random(in: 1..<3)
        let heartImage = iconNumber == 1 ? "heart" : "broken_heart"
        heartIcon.image = UIImage(named: heartImage)
        
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.frame = heartIcon.bounds

        if heartToCollect == .full && heartImage == "heart" {
            heartIcon.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            heartIcon.layer.shadowColor = UIColor.systemRed.cgColor
            heartIcon.layer.shadowRadius = 7
            heartIcon.layer.shadowOpacity = 1
        }
        
        if heartToCollect == .broken && heartImage == "broken_heart" {
            heartIcon.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            heartIcon.layer.shadowColor = UIColor.white.cgColor
            heartIcon.layer.shadowRadius = 7
            heartIcon.layer.shadowOpacity = 1
        }
        
        self.background.addSubview(heartIcon)
        hearts.append(heartIcon)
        
        return heartIcon
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func finishDrop() {
        hearts.forEach { $0.removeFromSuperview() }
        timer.invalidate()
    }
    
    @objc func pannedView(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
            case .changed:
                animator.removeBehavior(collision)
                let translation = recognizer.translation(in: self)
                pote.center = CGPoint(
                    x: pote.center.x + translation.x,
                    y: pote.center.y
                )
                recognizer.setTranslation(.zero, in: self)
                self.addCollisionBehavior()
            default:
                break
        }
    }
}
