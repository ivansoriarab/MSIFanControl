//
//  AppDelegate.swift
//  MSIFanControl
//
//  Created by lgs3137 on 2020/1/5.
//  Copyright © 2020 none. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var AboutMenuItem: NSMenuItem!
    @IBOutlet weak var HideMenuItem: NSMenuItem!
    @IBOutlet weak var HideOthersMenuItem: NSMenuItem!
    @IBOutlet weak var ShowAllMenuItem: NSMenuItem!
    @IBOutlet weak var QuitMenuItem: NSMenuItem!
    @IBOutlet weak var WindowMenu: NSMenu!
    @IBOutlet weak var MinimizeMenuEntry: NSMenuItem!
    @IBOutlet weak var ZoomMenuEntry: NSMenuItem!
    @IBOutlet weak var BringAllToFrontMenuEntry: NSMenuItem!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        AboutMenuItem.title = NSLocalizedString("关于MSIFanControl", comment: "")
        HideMenuItem.title = NSLocalizedString("隐藏MSIFanControl", comment: "")
        HideOthersMenuItem.title = NSLocalizedString("隐藏其他", comment: "")
        ShowAllMenuItem.title = NSLocalizedString("显示全部", comment: "")
        QuitMenuItem.title =  NSLocalizedString("退出MSIFanControl", comment: "")
        WindowMenu.title = NSLocalizedString("窗口", comment: "")
        MinimizeMenuEntry.title = NSLocalizedString("最小化", comment: "")
        ZoomMenuEntry.title = NSLocalizedString("缩放", comment: "")
        BringAllToFrontMenuEntry.title = NSLocalizedString("将所有窗口置于顶层", comment: "")
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

