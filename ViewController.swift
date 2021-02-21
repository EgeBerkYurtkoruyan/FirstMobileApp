//
//  ViewController.swift
//  muzGame
//
//  Created by Ege Berk Yurtkoruyan on 10.07.2020.
//  Copyright © 2020 Ege Berk Yurtkoruyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tim = Timer()
    var saklaGitsin = Timer()
    var counter = 10
    var score = 0
    var muzArray = [UIImageView]()
    var hi = 0
    var finished = false
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var hiScore: UILabel!
    
    
    @IBOutlet weak var muz1: UIImageView!
    @IBOutlet weak var muz2: UIImageView!
    @IBOutlet weak var muz3: UIImageView!
    @IBOutlet weak var muz4: UIImageView!
    @IBOutlet weak var muz5: UIImageView!
    @IBOutlet weak var muz6: UIImageView!
    @IBOutlet weak var muz7: UIImageView!
    @IBOutlet weak var muz8: UIImageView!
    @IBOutlet weak var muz9: UIImageView!
    @IBOutlet weak var muz10: UIImageView!
    @IBOutlet weak var muz11: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loadHS = UserDefaults.standard.object(forKey: "high")
        
        if let hh = loadHS as? String {
            hiScore.text = "\(hh)"
        }else{
            hiScore.text = "High Score: "
        }
        
        
        tim = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(zaman) , userInfo: nil, repeats: true)
        
        muz1.isUserInteractionEnabled = true
        muz2.isUserInteractionEnabled = true
        muz3.isUserInteractionEnabled = true
        muz4.isUserInteractionEnabled = true
        muz5.isUserInteractionEnabled = true
        muz6.isUserInteractionEnabled = true
        muz7.isUserInteractionEnabled = true
        muz8.isUserInteractionEnabled = true
        muz9.isUserInteractionEnabled = true
        muz10.isUserInteractionEnabled = true
        muz11.isUserInteractionEnabled = true
        
        let r1  = UITapGestureRecognizer(target: self, action: #selector(skor))
        let r2  = UITapGestureRecognizer(target: self, action: #selector(skor))
        let r3  = UITapGestureRecognizer(target: self, action: #selector(skor))
        let r4  = UITapGestureRecognizer(target: self, action: #selector(skor))
        let r5  = UITapGestureRecognizer(target: self, action: #selector(skor))
        let r6  = UITapGestureRecognizer(target: self, action: #selector(skor))
        let r7  = UITapGestureRecognizer(target: self, action: #selector(skor))
        let r8  = UITapGestureRecognizer(target: self, action: #selector(skor))
        let r9  = UITapGestureRecognizer(target: self, action: #selector(skor))
        let r10 = UITapGestureRecognizer(target: self, action: #selector(skor))
        let r11 = UITapGestureRecognizer(target: self, action: #selector(skor))
        
        muz1.addGestureRecognizer(r1)
        muz2.addGestureRecognizer(r2)
        muz3.addGestureRecognizer(r3)
        muz4.addGestureRecognizer(r4)
        muz5.addGestureRecognizer(r5)
        muz6.addGestureRecognizer(r6)
        muz7.addGestureRecognizer(r7)
        muz8.addGestureRecognizer(r8)
        muz9.addGestureRecognizer(r9)
        muz10.addGestureRecognizer(r10)
        muz11.addGestureRecognizer(r11)
        
        muz1.isHidden = true
        muz2.isHidden = true
        muz3.isHidden = true
        muz4.isHidden = true
        muz5.isHidden = true
        muz6.isHidden = true
        muz7.isHidden = true
        muz8.isHidden = true
        muz9.isHidden = true
        muz10.isHidden = true
        muz11.isHidden = true
        
        
        muzArray = [muz1, muz2, muz3, muz4, muz5, muz6, muz7, muz8, muz9, muz10, muz11]
        
        saklaGitsin = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(muzuSakla) , userInfo: nil, repeats: true)
    
    }
    
    
    @objc func muzuSakla() {
        
        for m in muzArray {
            m.isHidden = true
        }
        
        if !finished{
            let randomme = Int(arc4random_uniform(UInt32(muzArray.count - 1)))
            muzArray[randomme].isHidden = false
            
        }
    }
    
    
    @objc func skor() {
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    

    @objc func zaman () {
        
        if counter > 0 {
            timeLabel.text = "\(counter)"
            counter -= 1
        }else if timeLabel.text == " YARRAMI YE " {
            
            let uyari2 = UIAlertController(title: " :D ", message: "again?", preferredStyle: UIAlertController.Style.alert)
            
            let yes = UIAlertAction(title: "yes", style: UIAlertAction.Style.default) { (UIAlertAction) in
                
            self.counter = 10
            self.score = 0
            self.scoreLabel.text = "Score: 0"
            self.finished = false
                
            }
            uyari2.addAction(yes)
            self.present(uyari2, animated: true , completion: nil)
            
        }else{
            
            timeLabel.text = "0"
            
            let uyari = UIAlertController(title: "GAME OVER", message: "play again?", preferredStyle: UIAlertController.Style.alert)
            
            let no = UIAlertAction(title: "no", style: UIAlertAction.Style.default) { (UIAlertAction) in
                
                if self.hi < self.score{
                    self.hiScore.text = "High Score: \(self.score)"
                    self.hi = self.score
                    UserDefaults.standard.set(self.hiScore.text , forKey: "high")
                }
                self.score = 0
                self.scoreLabel.text = "Score: 0"
                self.timeLabel.text = " Ready? "
                self.finished = true
                
                
            }
            
            let yes = UIAlertAction(title: "yes", style: UIAlertAction.Style.default) { (UIAlertAction) in
                
                if self.hi < self.score{
                    self.hiScore.text = "High Score: \(self.score)"
                    self.hi = self.score
                    UserDefaults.standard.set(self.hiScore.text , forKey: "high")
                }
                self.counter = 10
                self.score = 0
                self.scoreLabel.text = "Score: 0"
                self.finished = false
               
                
            }
            uyari.addAction(yes)
            uyari.addAction(no)
            
            self.present(uyari, animated: true , completion: nil)
//         ALERT GELECEK BURAYA
        }
           
    }

}

