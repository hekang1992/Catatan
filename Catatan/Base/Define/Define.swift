//
//  Define.swift
//  Catatan
//
//  Created by apple on 2024/2/26.
//

import Foundation
import UIKit
import SnapKit
import UIColor_Hex_Swift

// 屏幕宽度
let SCREEN_WIDTH = UIScreen.main.bounds.size.width

// 屏幕高度
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

// AppDelegate
let APPDELEGATE = UIApplication.shared.delegate

// Window
let KWINDOW = UIApplication.shared.delegate?.window

let CNotificationCenter = NotificationCenter.default

// Default
let USER_DEFAULTS = UserDefaults.standard

let SET_ROOTVC = "SET_ROOTVC"

let LOGIN_SEIZES = "seizes"

// 状态栏高度
let STATUSBAR_HIGH = is_iPhoneXSeries() ? 44 : 20

// 导航栏高度
let NAV_HIGH = 44 + STATUSBAR_HIGH;

let keychain_service = "KeyChain_Service"

let keychain_account = "KeyChain_Account"

let TITLE_COLOR = "#959595"

func is_iPhoneXSeries() -> (Bool) {
    let boundsSize = UIScreen.main.bounds.size;
    // iPhoneX,XS
    let x_xs = CGSize(width: 375, height: 812);
    if (__CGSizeEqualToSize(boundsSize, x_xs)) {
        return true
    }
    // iPhoneXS Max,XR
    let xsmax_xr = CGSize(width: 414, height: 896);
    if (__CGSizeEqualToSize(boundsSize, xsmax_xr)) {
        return true
    }
    return false
}

extension String {
    /// String使用下标截取字符串
    /// string[index] 例如："abcdefg"[3] // c
    subscript (i:Int)->String{
        let startIndex = self.index(self.startIndex, offsetBy: i)
        let endIndex = self.index(startIndex, offsetBy: 1)
        return String(self[startIndex..<endIndex])
    }
    /// String使用下标截取字符串
    /// string[index..<index] 例如："abcdefg"[3..<4] // d
    subscript (r: Range<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
            return String(self[startIndex..<endIndex])
        }
    }
    /// String使用下标截取字符串
    /// string[index,length] 例如："abcdefg"[3,2] // de
    subscript (index:Int , length:Int) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: index)
            
            let endIndex = self.index(startIndex, offsetBy: length)
            return String(self[startIndex..<endIndex])
        }
    }
    // 截取 从头到i位置
    func substring(to:Int) -> String{
        return self[0..<to]
    }
    // 截取 从i到尾部
    func substring(from:Int) -> String{
        return self[from..<self.count]
    }
}

extension UIColor {
    static func random() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        let alpha = CGFloat.random(in: 0...1)
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension UILabel {
    static func createLabel(font: UIFont, textColor: UIColor, textAlignment: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.backgroundColor = UIColor.clear
        return label
    }
}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
}

extension Double {
    func pix() -> CGFloat {
        return CGFloat.init(CGFloat.init(self)/375.0 * SCREEN_WIDTH)
    }
}

extension CGFloat {
    func pix() -> CGFloat {
        return CGFloat.init(CGFloat.init(self)/375.0 * SCREEN_WIDTH)
    }
}

extension Int {
    func pix() -> CGFloat {
        return CGFloat.init(CGFloat.init(self)/375.0 * SCREEN_WIDTH)
    }
}

extension CGFloat {
    func minus() -> CGFloat{
        return 0 - self
    }
}

let TabBarHeight = 54.pix()


func topViewController() -> UIViewController? {
    var window = UIApplication.shared.delegate?.window ?? UIWindow()

    if window?.windowLevel != UIWindow.Level.normal {
        let windows = UIApplication.shared.windows
        for tmpWin in windows {
            if tmpWin.windowLevel == UIWindow.Level.normal {
                window = tmpWin
                break
            }
        }
    }

    var rootVC = window?.rootViewController
    var activityVC: UIViewController?
    while true {
        if let navController = rootVC as? UINavigationController {
            activityVC = navController.visibleViewController
        } else if let tabController = rootVC as? UITabBarController {
            activityVC = tabController.selectedViewController
        } else if let presentedVC = rootVC?.presentedViewController {
            activityVC = presentedVC
        } else {
            break
        }

        rootVC = activityVC
    }
    return activityVC
}
