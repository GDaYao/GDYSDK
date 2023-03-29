//
//  Constant.swift
//  GDYSDK
//


/*
 App常量宏定义 - swift版本呢
 */


import Foundation


let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height

let kIsiPhoneXOver = ((kScreenWidth >= 375.0) && (kScreenHeight >= 812.0))


let kIsiPhone6A6sA7A8 = (kScreenWidth == 375.0 && kScreenHeight == 667.0)
let kIsiPhone6PA6sPA7PA8P = (kScreenWidth == 414.0 && kScreenHeight == 736.0)
let kIsiPhoneXSMaxAndXRAnd11And11ProMax =  (kScreenWidth == 414.0  && kScreenHeight == 896.0)
let kIsiPhoneXAndXSAnd11ProAnd12MiniAnd13Mini =   (kScreenWidth == 375.0 && kScreenHeight == 812.0)
let kIsiPhone12ProMaxAnd13ProMax = (kScreenWidth == 428.0 && kScreenHeight == 926.0)
let kIsiPhone12And12ProAnd13And13Pro = (kScreenWidth == 390.0 && kScreenHeight == 844.0)


let kStatusBarSizeHNum = (kIsiPhoneXOver ? 44.0 : 20.0)
let kNavBarHNum = 44.0
let kTabBarHeightNum = 49.0
let kSafeBottomMargin = ( kIsiPhoneXOver ? 34.0 : 0.0)


// 根据色值生成颜色(无透明度)(格式为0xffffff)
var kUIColorFromHex: (NSInteger) -> UIColor = {hex in
    return UIColor(red: ((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0, green: ((CGFloat)((hex & 0xFF00) >> 8)) / 255.0, blue: ((CGFloat)(hex & 0xFF)) / 255.0, alpha: 1.0);
}
// 根据色值生成颜色(透明度)(格式为0xffffff,1.0)
var kUIColorFromHexAlpha: (NSInteger,CGFloat) -> UIColor = {hex,alphaF in
    return UIColor(red: ((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0, green: ((CGFloat)((hex & 0xFF00) >> 8)) / 255.0, blue: ((CGFloat)(hex & 0xFF)) / 255.0, alpha: alphaF);
}
