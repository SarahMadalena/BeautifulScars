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
//    @State var animateWrongHeart: Bool = false
    //@State var brokenHeart: Bool // contabilizar os coraçoes partidos
    @Binding var pause: Bool
    @State var coordinator = FallingHeartsViewCoordinator()
    
    func makeUIView(context: Context) -> UIView {
        let screen = FallingHearts()
        context.coordinator.screen = screen
        screen.collision.collisionDelegate = context.coordinator
        return screen
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        if !pause {
            let view = uiView as! FallingHearts
            view.timer.fire()
        }
        print("updateUIView \(coordinator.collectedHeartsCounter)")
    }
    
    func makeCoordinator() -> FallingHeartsViewCoordinator {
        coordinator
    }
}

class FallingHearts: UIView {
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    var progressView: ProgressBarViewStyle = ProgressBarViewStyle() //chamar minha progressBar
    
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
      
    
//    let progressBar = ProgressBar()
    
    var actionWhenPhaseOver: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(pannedView)) //panGesture: responsavel por movimentar
        pote.addGestureRecognizer(panGesture) //reconhece o movimento do gesture
        pote.isUserInteractionEnabled = true //habilita o movimento
        
//        self.progressView = ProgressBarViewStyle()
//        progressView.makeBody(configuration: ProgressViewStyleConfiguration.CurrentValueLabel)
        progressView.progress = 0.5
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
//        let imagemTeste = UIImage(named: "broken_heart")

        self.collision.addItem(heart)
        self.gravity.addItem(heart)
        
        
//        if let brokenHeart = item.brokenHeart{
//            let _ = 
//        }
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
                y: 150,
                width: 70,
                height: 70
            )
        )
        let iconNumber = Int.random(in: 1..<3)
        
        heartIcon.image = UIImage(named: iconNumber == 1 ? "heart" : "broken_heart")
        self.background.addSubview(heartIcon)
        self.sendSubviewToBack(heartIcon)
        
        return heartIcon
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func pannedView(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .changed:
            animator.removeBehavior(collision)
            let translation = recognizer.translation(in: self)
            pote.center = CGPoint(
                x: pote.center.x + translation.x,
                y: pote.center.y)
            recognizer.setTranslation(.zero, in: self)
            self.addCollisionBehavior()
        default:
            break
        }
    }
}
