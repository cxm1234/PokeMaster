//
//  BlurView.swift
//  PokeMaster
//
//  Created by ming on 2024/4/9.
//

import SwiftUI
import UIKit

struct BlurView: UIViewRepresentable {
    
    let style: UIBlurEffect.Style
    
    init(style: UIBlurEffect.Style) {
        self.style = style
    }
    
    func makeUIView(context: Context) -> UIBlurView {
        let view = UIBlurView(style: style, frame: .zero)
        return view
    }
    
    func updateUIView(_ uiView: UIBlurView, context: Context) {
        let blurEffect = UIBlurEffect(style: style)
        UIView.animate(withDuration: 0.25) {
            uiView.blurView?.effect = blurEffect
        }
    }
}

extension View {
    func blurBackground(style: UIBlurEffect.Style) -> some View {
        ZStack {
            BlurView(style: style)
            self
        }
    }
}

class UIBlurView: UIView {
    
    let style: UIBlurEffect.Style
    var blurView: UIVisualEffectView?
    
    init(style: UIBlurEffect.Style, frame: CGRect) {
        self.style = style
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView() {
        self.backgroundColor = .clear
        
        let blurEffect = UIBlurEffect(style: style)
        blurView = UIVisualEffectView(effect: blurEffect)
        blurView?.translatesAutoresizingMaskIntoConstraints = false
        guard let blurView else {
            return
        }
        self.addSubview(blurView)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: self.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
        
    }
    
}
