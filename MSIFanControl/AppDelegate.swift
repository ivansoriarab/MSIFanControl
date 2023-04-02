//
//  AppDelegate.swift
//  MSIFanControl
//
//  Created by lgs3137 on 2020/1/5.
//  Updated by ivansoriarab on 2023/4/2.
//  Copyright © 2020 - 2023: lgs3137 - ivansoriarab.
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
        AboutMenuItem.title = NSLocalizedString("关于 MSI Fan Control", comment: "Title of the 'About MSI Fan Control' window that displays information about the application")
        HideMenuItem.title = NSLocalizedString("隐藏 MSI Fan Control", comment: "Title of the menu entry that hides the window")
        HideOthersMenuItem.title = NSLocalizedString("隐藏其他", comment: "Title of the menu entry that hides all open windows except for the current one")
        ShowAllMenuItem.title = NSLocalizedString("显示全部", comment: "Title of the menu entry that displays all the windows of the application")
        QuitMenuItem.title =  NSLocalizedString("退出 MSI Fan Control", comment: "Title of the menu entry that closes MSI Fan Control")
        WindowMenu.title = NSLocalizedString("窗口", comment: "Title for the 'Window' menu")
        MinimizeMenuEntry.title = NSLocalizedString("最小化", comment: "Title of the menu entry that minimizes the current window")
        ZoomMenuEntry.title = NSLocalizedString("缩放", comment: "Title of the menu entry to zoom in on the current window")
        BringAllToFrontMenuEntry.title = NSLocalizedString("将所有窗口置于顶层", comment: "Title of the menu entry to bring all windows of the application to the front")
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

