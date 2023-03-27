//
//  ViewController.swift
//  MSIFanControl
//
//  Created by lgs3137 on 2020/1/5.
//  Copyright © 2020 none. All rights reserved.
//

import Cocoa

var inputOk = 0

class ViewController: NSViewController {

    @IBOutlet weak var toggleFanControlLabel: NSTextField!
    @IBOutlet weak var autoBtn: NSSwitch!
    @IBOutlet weak var fan0: NSTextField!
    @IBOutlet weak var fan1: NSTextField!
    @IBOutlet weak var fan2: NSTextField!
    @IBOutlet weak var fan3: NSTextField!
    @IBOutlet weak var fan4: NSTextField!
    @IBOutlet weak var fan5: NSTextField!
    @IBOutlet weak var enterBtn: NSButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        toggleFanControlLabel.stringValue = String(format: NSLocalizedString("切换风扇控制", comment: ""), NSLocalizedString("启用", comment: ""))
        enterBtn.title = NSLocalizedString("确认", comment: "")
    }
    
    // 判断开关并恢复初始值
    @IBAction func autoBtn(_ sender: Any) {
        if (autoBtn.state.rawValue == 1) {
            toggleFanControlLabel.stringValue = String(format: NSLocalizedString("切换风扇控制", comment: ""), NSLocalizedString("禁用", comment: ""))
            fan0.isEditable = true
            fan1.isEditable = true
            fan2.isEditable = true
            fan3.isEditable = true
            fan4.isEditable = true
            fan5.isEditable = true
        }
        else {
            toggleFanControlLabel.stringValue = String(format: NSLocalizedString("切换风扇控制", comment: ""), NSLocalizedString("启用", comment: ""))
        }
    }

    @IBAction func enterBtn(_ sender: Any) {
        // 简单判断输入
        inputOk = 0
        checkInput(inputs: fan0.stringValue)
        checkInput(inputs: fan1.stringValue)
        checkInput(inputs: fan2.stringValue)
        checkInput(inputs: fan3.stringValue)
        checkInput(inputs: fan4.stringValue)
        checkInput(inputs: fan5.stringValue)

        // 转换格式
        let d0 = String((fan0.stringValue as NSString).integerValue)
        let d1 = String((fan1.stringValue as NSString).integerValue)
        let d2 = String((fan2.stringValue as NSString).integerValue)
        let d3 = String((fan3.stringValue as NSString).integerValue)
        let d4 = String((fan4.stringValue as NSString).integerValue)
        let d5 = String((fan5.stringValue as NSString).integerValue)

        // 判断并执行
        if (inputOk == 6) {
            showMsg(msg:shellTask([d0, d1, d2, d3, d4, d5]))
        }
        else {
            showMsg(msg:NSLocalizedString("请输入0~100数字!", comment: ""))
        }
    }

    // 简单校验输入是否符合0~100
    func checkInput(inputs:String) {
        let input = (inputs as NSString).integerValue
        if (0 <= input && input <= 100) {
            inputOk = inputOk + 1
        }
    }

    // 弹窗
    func showMsg(msg:String) {
        let alert = NSAlert()
        alert.messageText = "MSIFanControl"
        alert.informativeText = msg
        alert.alertStyle = .critical
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }

    // 执行Shell命令
    func shellTask(_ args: [String]) -> String {
        let task = Process()
        guard let path = Bundle.main.path(forResource: "MSIECControl",ofType:"") else {
            return NSLocalizedString("失败!\nMSIECControl 丢失!", comment: "")
        }
        task.launchPath = path
        task.arguments = args

        let pipe = Pipe()
        task.standardOutput = pipe
        task.launch()
        task.waitUntilExit()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output: String = NSString(data: data, encoding: String.Encoding.utf8.rawValue)! as String

        return output
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

