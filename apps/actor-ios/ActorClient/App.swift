//
//  App.swift
//  ActorApp
//
//  Created by Stepan Korshakov on 15.04.15.
//  Copyright (c) 2015 Actor LLC. All rights reserved.
//

import Foundation


private let themeName = NSBundle.mainBundle().objectForInfoDictionaryKey("APP_THEME") as! String
var MainAppTheme = ("llectro" == themeName) ? LlectroTheme()  : AppTheme()

var isIPad = UIDevice.currentDevice().userInterfaceIdiom == .Pad

let isiOS8 = floor(NSFoundationVersionNumber) > floor(NSFoundationVersionNumber_iOS_7_1)

var isRetina : Bool {
    get {
        return UIScreen.mainScreen().scale > 1
    }
}

var retinaPixel : CGFloat {
    get {
        return isRetina ? 0.5 : 1.0
    }
}