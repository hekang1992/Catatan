//
//  HudView.swift
//  Catatan
//
//  Created by apple on 2024/3/4.
//

import UIKit
import Lottie

class HudView: UIView {
    
    private lazy var grayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return view
    }()
    
    private lazy var hudView: LottieAnimationView = {
        let animationView = LottieAnimationView(name: "loading.json", bundle: Bundle.main)
        animationView.loopMode = .loop
        animationView.play()
        return animationView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        addSubview(grayView)
        grayView.addSubview(hudView)
        setConstraints()
    }
    
    private func setConstraints() {
        grayView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        hudView.snp.makeConstraints { make in
            make.center.equalTo(self)
            make.size.equalTo(CGSize(width: 120.pix(), height: 120.pix()))
        }
    }
}
