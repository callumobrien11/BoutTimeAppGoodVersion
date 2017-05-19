//
//  ViewController.swift
//  BoutTime App
//
//  Created by Callum O'Brien on 2017-04-14.
//  Copyright © 2017 Callum. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    // MARK: UI Label Outlets
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    // MARK: UI Button Outlets
    @IBOutlet weak var fullDown: UIButton!
    @IBOutlet weak var topHalfUp: UIButton!
    @IBOutlet weak var topHalfDown: UIButton!
    @IBOutlet weak var bottomHalfUp: UIButton!
    @IBOutlet weak var bottomHalfDown: UIButton!
    @IBOutlet weak var fullUp: UIButton!
    @IBOutlet weak var notice: UILabel!
    
    
    @IBOutlet weak var correct: UIButton!
    @IBOutlet weak var notCorrect: UIButton!
    @IBOutlet weak var playAgain: UIButton!
    
    @IBOutlet weak var userScore: UILabel!
    
    @IBOutlet weak var timer: UILabel!
    
    var time = Timer()
    
    var seconds = 61
    
    func startTime() {
        
    time = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
    }
    
    var correctSound = AVAudioPlayer()
    var incorrectSound = AVAudioPlayer()

    
    func correctSounds() {
        do {
        correctSound = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "CorrectDing", ofType: "wav")!))
            correctSound.prepareToPlay()
            
            let correctSoundSession = AVAudioSession.sharedInstance()
            do{
                
            try correctSoundSession.setCategory(AVAudioSessionCategoryPlayback)
                
                correctSound.play()
                
            } catch {
                
            }
            
        }
        catch
        {
            print(error)
    
        }
    }
        func incorrectSounds() {
    
        do {
            incorrectSound = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "IncorrectBuzz", ofType: "wav")!))
            incorrectSound.prepareToPlay()
            
                incorrectSound.play()
            }
            
            catch {
     
            print(error)
            
            }
        }


    func counter() {
        seconds -= 1
        
        if seconds < 0 {
            
            time.invalidate()
            
        checkAnswer()
            
        } else if seconds < 10 {
            timer.text = "0:0\(seconds)"
        } else if seconds > 9 {
            timer.text = "0:\(seconds)"
        }
        
    }
    
    // MARK: vdl
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
            events.displayEvents(label1: label1, label2: label2, label3: label3, label4: label4)
        correct.isHidden = true
        notCorrect.isHidden = true
        playAgain.isHidden = true
        userScore.isHidden = true
        
        startTime()
        
        
    }
    
   
    var currentRound: Int = 0
    var correctScore: Int = 0
    let numberOfRounds = 6
    


    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake {
            
            if currentRound != numberOfRounds || currentRound != 0 {
            
            checkAnswer()
            
            time.invalidate()
            }
        }
        
    }
    
    //Restart Button
    @IBAction func playAgain(_ sender: UIButton) {
        if sender == playAgain {
            events.displayEvents(label1: label1, label2: label2, label3: label3, label4: label4)
            playAgain.isHidden = true
            userScore.isHidden = true
                                    currentRound = 0
            correctScore = 0
            
            fullDown.isHidden = false
            topHalfUp.isHidden = false
            topHalfDown.isHidden = false
            bottomHalfUp.isHidden = false
            bottomHalfDown.isHidden = false
            fullUp.isHidden = false
            notice.isHidden = false
            timer.isHidden = false

            startTime()

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
     }


    
    @IBAction func swapValues(_ sender: UIButton) {
        
       if sender == fullDown || sender == topHalfUp  {
            swap(&label1.text, &label2.text)
            swap(&label1.tag, &label2.tag)
            
            
       } else if sender == topHalfDown || sender == bottomHalfUp {
        swap(&label2.text, &label3.text)
        swap(&label2.tag, &label3.tag)
        
       } else if sender == bottomHalfDown || sender == fullUp {
        swap(&label3.text, &label4.text)
        swap(&label3.tag, &label4.tag)
        }
        
        
    }
    @IBAction func nextRound(_ sender: UIButton) {
        currentRound += 1
        
        if currentRound == numberOfRounds {
            
            userScore.text = "Your score is \(correctScore) / 6"
            label1.isHidden = true
            label2.isHidden = true
            label3.isHidden = true
            label4.isHidden = true
            fullDown.isHidden = true
            topHalfUp.isHidden = true
            topHalfDown.isHidden = true
            bottomHalfUp.isHidden = true
            bottomHalfDown.isHidden = true
            fullUp.isHidden = true
            userScore.isHidden = false
            playAgain.isHidden = false
            correct.isHidden = true
            notCorrect.isHidden = true
            notice.isHidden = true
            timer.isHidden = true
            time.invalidate()
            
            
            correctScore = 0
            
            currentRound = 0
        
            
            
        } else {
        
        correct.isHidden = true
        notCorrect.isHidden = true
        
        events.displayEvents(label1: label1, label2: label2, label3: label3, label4: label4)
        }
        
        
        seconds = 61
        startTime()
        
    }
    
    func checkAnswer() {
        if label1.tag > label2.tag && label2.tag > label3.tag && label3.tag > label4.tag {
            correct.isHidden = false
            notCorrect.isHidden = true
            correctScore += 1
            correctSounds()
            
        } else {
            notCorrect.isHidden = false
            correct.isHidden = true
            incorrectSounds()
        }
    }
    
    
    
    
}




    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


