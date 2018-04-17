//
//  ViewController.swift
//  Alarmtimer
//
//  Created by D7703_27 on 2018. 4. 12..
//  Copyright © 2018년 D7703_27. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var currentTimeLabel: UILabel!
    var myTimer = Timer()
    var count = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd HH:mm:ss"
        timeLabel.text = formatter.string(from: myDatePicker.date)
        myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(myTimer) in self.updateTime()
            
        })
    }
    func updateTime() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd HH:mm:ss"
        currentTimeLabel.text = formatter.string(from: date)
        if currentTimeLabel.text == timeLabel.text {
            view.backgroundColor = UIColor.red
            count = false
            let myAlert = UIAlertController(title: "알림", message: "설정된 시간이 되었습니다.", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "확인", style: .default, handler: {(myAction: UIAlertAction) -> Void in
                self.view.backgroundColor = UIColor.white
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {(myAction: UIAlertAction) -> Void in
                self.view.backgroundColor = UIColor.red
            })
            
            myAlert.addAction(cancelAction)
            myAlert.addAction(okAction)
            present(myAlert, animated: true, completion: nil)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func changeDatePicker(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd HH:mm:ss"
        timeLabel.text = formatter.string(from: myDatePicker.date)
    }
    

    @IBAction func btn(_ sender: Any) {
        if count == false {
            view.backgroundColor = UIColor.white
            count = true
        }
    }
    
}

