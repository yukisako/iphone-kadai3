//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 迫 佑樹 on 2017/04/29.
//  Copyright © 2017年 Yuki Sako. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slideImage: UIImageView!

    var timer: Timer!
    var picNum = 0
    var isPlaying = false
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var slideshowButton: UIButton!
    
    
    
    @IBAction func tapPhoto(_ sender: Any) {
        performSegue(withIdentifier: "PhotoSegue", sender: nil)
    }
    
    func nextPic(){
        print(picNum)
        picNum += 1
        //2以上だと0に戻す
        if(picNum > 2){
            picNum = 0
        }
    }
    
    func backPic(){
        picNum -= 1
        //0より小さくなると戻す
        if(picNum < 0){
            picNum = 2
        }
    }
    
    func updatePic(){
        let displayImage:UIImage! = UIImage(named: "\(self.picNum).png")
        slideImage.image = displayImage
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        backPic()
        updatePic()
    }
    
    @IBAction func nextButton(_ sender: Any) {
        nextPic()
        updatePic()
    }
    
    @IBAction func playButton(_ sender: Any) {
        
        if(!isPlaying){
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(nextButton(_:)), userInfo: nil, repeats: true)
            nextButton.isEnabled = false
            backButton.isEnabled = false
            slideshowButton.setTitle("停止", for: UIControlState.normal)
            isPlaying = true
        } else {
            self.timer.invalidate()
            nextButton.isEnabled = true
            backButton.isEnabled = true
            slideshowButton.setTitle("再生", for: UIControlState.normal)
            isPlaying = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let photoViewController: PhotoViewController = segue.destination as! PhotoViewController
        photoViewController.picNum = self.picNum
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

