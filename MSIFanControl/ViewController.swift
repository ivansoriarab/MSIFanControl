//
//  ViewController.swift
//  MSIFanControl
//
//  Created by lgs3137 on 2020/1/5.
//  Updated by ivansoriarab on 2023/4/2.
//  Copyright © 2020 - 2023: lgs3137 - ivansoriarab.
//

import Cocoa

var inputOk = 0

class ViewController: NSViewController {

    @IBOutlet weak var toggleLbl: NSTextField!
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
        
        toggleLbl.stringValue = NSLocalizedString("设置风扇速度", comment: "Label that appears next to a switch, which allows the user to set a custom fan speed when it is turned on")
        enterBtn.title = NSLocalizedString("确认", comment: "Button that confirms the user's action")
    }
    
    // Determines the switch status and enables or disables the fan inputs accordingly.
    // When the switch is off, the default speed values are set.
    @IBAction func autoBtn(_ sender: Any) {
        fan0.isEnabled = (autoBtn.state.rawValue == 1)
        fan1.isEnabled = (autoBtn.state.rawValue == 1)
        fan2.isEnabled = (autoBtn.state.rawValue == 1)
        fan3.isEnabled = (autoBtn.state.rawValue == 1)
        fan4.isEnabled = (autoBtn.state.rawValue == 1)
        fan5.isEnabled = (autoBtn.state.rawValue == 1)
        enterBtn.isEnabled = (autoBtn.state.rawValue == 1)
        
        if (autoBtn.state.rawValue == 0) {
            showMsg(msg:shellTask(["20", "30", "40", "60", "80", "100"]))
        }
    }

    @IBAction func enterBtn(_ sender: Any) {
        // Input verification
        inputOk = 0
        checkInput(inputs: fan0.stringValue)
        checkInput(inputs: fan1.stringValue)
        checkInput(inputs: fan2.stringValue)
        checkInput(inputs: fan3.stringValue)
        checkInput(inputs: fan4.stringValue)
        checkInput(inputs: fan5.stringValue)

        // Format conversion
        let d0 = String((fan0.stringValue as NSString).integerValue)
        let d1 = String((fan1.stringValue as NSString).integerValue)
        let d2 = String((fan2.stringValue as NSString).integerValue)
        let d3 = String((fan3.stringValue as NSString).integerValue)
        let d4 = String((fan4.stringValue as NSString).integerValue)
        let d5 = String((fan5.stringValue as NSString).integerValue)

        // Sets the speed or displays a pop-up if the values are invalid.
        if (inputOk == 6) {
            showMsg(msg:shellTask([d0, d1, d2, d3, d4, d5]))
        }
        else {
            showMsg(msg:NSLocalizedString("请输入0~100数字!", comment: "Warning message indicating that the user must enter a number between 0 and 100"))
        }
    }

    // Validation to ensure that the input value is between 0 and 100.
    func checkInput(inputs:String) {
        let input = (inputs as NSString).integerValue
        if (0 <= input && input <= 100) {
            inputOk = inputOk + 1
        }
    }

    func showMsg(msg:String) {
        let alert = NSAlert()
        alert.messageText = "MSI Fan Control"
        alert.informativeText = msg
        alert.alertStyle = .critical
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }

    func shellTask(_ args: [String]) -> String {
        let task = Process()
        guard let path = Bundle.main.path(forResource: "MSIECControl", ofType: "") else {
            return NSLocalizedString("失败!\nMSIECControl 丢失!", comment: "Error message displayed when MSIECControl fails to load correctly")
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

