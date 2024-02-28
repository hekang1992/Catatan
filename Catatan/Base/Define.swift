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

// Default
let USER_DEFAULTS = UserDefaults.standard

let LOGIN_SUCCESS = "LOGIN_SUCCESS"

// 状态栏高度
let STATUSBAR_HIGH = is_iPhoneXSeries() ? 44 : 20

func TITlog<T>(_ message: T, fileName: String = #file, funcName: String = #function, lineNum : Int = #line) {
    #if DEBUG
    /**
    * 此处还要在项目的build settings中搜索swift flags,找到 Other Swift Flags 找到Debug
    * 添加 -D DEBUG,即可。
    */
    // 1.对文件进行处理
    let file = (fileName as NSString).lastPathComponent
    // 2.打印内容
    print("[\(file)][\(funcName)](\(lineNum))\(message)")
    #endif
}

// 判断是否设备是iphoneX系列
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
