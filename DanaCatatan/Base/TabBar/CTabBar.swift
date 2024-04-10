//
//  CTabBar.swift
//  Catatan
//
//  Created by apple on 2024/2/26.
//

import UIKit

protocol YBTabBarDelegate: AnyObject {
    func ybTabBar(_ tabBar: CTabBar, didSelectedButtonFrom from: Int, to: Int)
}

class CTabBar: UIView, CustomTabBarButtonDelegate {
    
    weak var delegate: YBTabBarDelegate?
    private var selectedButton: YBTabBarButton?
    private var tabbarBtnArray: [YBTabBarButton] = []
    private var norImageArrM: [String] = []
    private var selImageArrM: [String] = []
    
    private lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(bgView)
        bgView.frame = bounds
    }
    
    func addTabBarButtonNorImageUrl(_ norImageUrl: String, selImageUrl: String, title: String) {
        let tabBarBtn = YBTabBarButton()
        tabBarBtn.delegate = self
        tabBarBtn.backgroundColor = UIColor.white
        addSubview(tabBarBtn)
        tabBarBtn.setTabBarImage(url: norImageUrl, title: title)
        tabBarBtn.addTarget(self, action: #selector(buttonClick(_:)), for: .touchDown)
        tabbarBtnArray.append(tabBarBtn)
        norImageArrM.append(norImageUrl)
        selImageArrM.append(selImageUrl)
        if tabbarBtnArray.count == 1 {
            buttonClick(tabBarBtn)
            tabBarBtn.iconBtn.isSelected = true
        }
    }
    
    func ybDealSelectButton(_ ybButton: YBTabBarButton) {
        for (index, currentButton) in tabbarBtnArray.enumerated() {
            if currentButton == ybButton {
                currentButton.iconBtn.isSelected = true
                currentButton.titleLbl.textColor = UIColor.white
                currentButton.iconBtn.setImage(UIImage(named: selImageArrM[index]), for: .normal)
                currentButton.backgroundColor = UIColor("#BBD598")
            } else {
                currentButton.iconBtn.isSelected = false
                currentButton.titleLbl.textColor = UIColor("#BBD598")
                currentButton.backgroundColor = UIColor("#FFFFFF")
                currentButton.iconBtn.setImage(UIImage(named: norImageArrM[index]), for: .normal)
            }
        }
    }
    
    func tabBarIconButtonClick(_ tabBarButton: YBTabBarButton) {
        buttonClick(tabBarButton)
    }
    
    // MARK: - Button Click
    
    @objc private func buttonClick(_ button: YBTabBarButton) {
        if let fromIndex = selectedButton?.tag {
            delegate?.ybTabBar(self, didSelectedButtonFrom: fromIndex, to: button.tag)
        }
        selectedButton?.isSelected = false
        button.isSelected = true
        selectedButton = button
        ybDealSelectButton(selectedButton!)
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let buttonW = (frame.width - 72.pix()) / CGFloat(tabbarBtnArray.count)
        let buttonY = 1.pix()
        for (index, button) in tabbarBtnArray.enumerated() {
            let buttonX = CGFloat(index) * (buttonW + 19.pix()) + 26.pix()
            button.frame = CGRect(x: buttonX, y: CGFloat(buttonY), width: buttonW, height: TabBarHeight)
            button.tag = index
        }
    }
}
