//
//  PopCityView.swift
//  Catatan
//
//  Created by apple on 2024/3/8.
//

import UIKit
import JXGradientKit

class PopCityView: UIView {

    lazy var bgView: UIView = {
        let bgView = GradientView()
        let topColer = UIColor("#E4D7EF")
        let minColer = UIColor("#DEE9CF")
        let booColer = UIColor("#E2EFF3")
        bgView.direction = GradientDirection.topToBottom
        bgView.startColor = topColer
        bgView.middleColor = minColer
        bgView.endColor = booColer
        return bgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self)
            make.height.equalTo(520.pix())
        }
        bgView.roundCorners(corners: [.topLeft,.topRight], radius: 20.pix())
    }
    
}
