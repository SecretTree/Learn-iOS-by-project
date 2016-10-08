//
//  ViewController.swift
//  StopWatch
//
//  Created by Wang Shuqing on 16/10/7.
//  Copyright © 2016年 Wang Shuqing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBAction func resetButtonDidTouch(_ sender: AnyObject) {
        timer.invalidate()
        isPlaying = false
        counter = 0
        timeLabel.text = String(counter)
        playBtn.isEnabled = true
        pauseBtn.isEnabled = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = String(counter)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func playButtonDidTouch(_ sender: AnyObject) {
        if (isPlaying) {
            return
        }
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.UpdateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    @IBAction func pauseButtonDidTouch(_ sender: AnyObject) {
        isPlaying = false
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        timer.invalidate()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func UpdateTimer() {
        counter = counter + 0.1
        timeLabel.text = String(format: "%.1f", arguments: [counter])
    }


}

