//
//  ViewController.swift
//  SKGramatika_REAL
//
//  Created by Michal Vavercak on 11/3/18.
//  Copyright © 2018 Michal Vavercak. All rights reserved.
//

import UIKit
import AVFoundation




class ViewController: UIViewController {
    
    var wrongTaps: [String] = []
    
    let allWords = WordData()
    
    var score = 0.00
    var atempt = 0.00
    var percentage = 0.00
    
    var right = 0
    var wrong = 0
    
    var answerState = 0
    
    var wordNumber = Int.random(in: 0...11)
    
    
    @IBOutlet weak var labelWord: UILabel!
    
    @IBOutlet weak var scoreCount: UILabel!
    
    @IBOutlet weak var labelCountWrong: UILabel!
    
    @IBOutlet weak var labelCountRight: UILabel!
    
    
    @IBOutlet weak var iButton: UIButton!
    
    @IBOutlet weak var yButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var wrongButton: UIButton!
    
    @IBOutlet weak var blurScore: UIVisualEffectView!
    
    @IBOutlet weak var blurB1: UIVisualEffectView!
    
    @IBOutlet weak var blurB2: UIVisualEffectView!
    
    
    override func viewDidLoad() {
        
        
        nextWord()
        
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        labelCountRight.text = String(right)
        labelCountWrong.text = String(wrong)
        if percentage == 0 {
            scoreCount.text = "Skóre: 0"
        } else {
        scoreCount.text = "Skóre " + String(Int(percentage)) + "%"
        }
        
        
        
        
        let blur = UIVisualEffectView(effect: UIBlurEffect(style:
            UIBlurEffect.Style.dark))
        
        
        let blur1 = UIVisualEffectView(effect: UIBlurEffect(style:
            UIBlurEffect.Style.dark))
        
        let blur2 = UIVisualEffectView(effect: UIBlurEffect(style:
            UIBlurEffect.Style.dark))
        
        let blur3 = UIVisualEffectView(effect: UIBlurEffect(style:
            UIBlurEffect.Style.dark))
        
        
        
        iButton.layer.cornerRadius = 0.5 * iButton.bounds.size.height
        blur.layer.cornerRadius = 0.5 * iButton.bounds.size.height
        blur.clipsToBounds = true
        blur.frame = iButton.bounds
        blur.isUserInteractionEnabled = false //This allows touches to forward to the button.
        iButton.insertSubview(blur, at: 0)
        
        
        
        
        
        
        
        yButton.layer.cornerRadius = 0.5 * yButton.bounds.size.width
        blur1.layer.cornerRadius = 0.5 * yButton.bounds.size.width
        blur1.clipsToBounds = true
        blur1.frame = yButton.bounds
        blur1.isUserInteractionEnabled = false //This allows touches to forward to the button.
        yButton.insertSubview(blur1, at: 0)
        
        resetButton.layer.cornerRadius = 0.5 * resetButton.bounds.size.height
        blur2.layer.cornerRadius = 0.5 * resetButton.bounds.size.height
        blur2.clipsToBounds = true
        blur2.frame = resetButton.bounds
        blur2.isUserInteractionEnabled = false //This allows touches to forward to the button.
        resetButton.insertSubview(blur2, at: 0)
        
        wrongButton.layer.cornerRadius = 0.5 * wrongButton.bounds.size.height
        blur3.layer.cornerRadius = 0.5 * wrongButton.bounds.size.height
        blur3.clipsToBounds = true
        blur3.frame = wrongButton.bounds
        blur3.isUserInteractionEnabled = false //This allows touches to forward to the button.
        wrongButton.insertSubview(blur3, at: 0)
        
        blurScore.layer.cornerRadius = 0.5 * blurScore.bounds.size.height
        blurScore.clipsToBounds = true
        
        blurB1.layer.cornerRadius = 0.5 * blurScore.bounds.size.height
        blurB1.clipsToBounds = true
        
        blurB2.layer.cornerRadius = 0.5 * blurScore.bounds.size.height
        blurB2.clipsToBounds = true
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    @IBAction func restartButton(_ sender: UIButton) {
        restart()
    }
    
    @IBAction func tapAnswer(_ sender: UIButton) {
        
        
        
        
        atempt = atempt + 1
        
        if sender.tag == 1 {
            answerState = 2
        } else {
            answerState = 1
            
        }
        
        checkAnswer()
        
        
       calcScore()
        
        
        
    
        
        
        nextWord()
    
        
        showCount()
        
        
       
        
    }
    
    
    
    func checkAnswer () {
        
        
        
        let correctAnswer = allWords.wordData[wordNumber].answer
        let correctAnswerWord = allWords.wordData[wordNumber].correct
        
        if answerState == correctAnswer {
            score = score + 1
            right += 1
            
            
            
            
            
            
        } else {
            score = score + 0
            wrong += 1
            
            blink()
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
            
            wrongTaps.append(correctAnswerWord)
            print(wrongTaps)
            
            
            
        }
    }
    
    
    func nextWord () {
        
        wordNumber = Int.random(in: 0...11)
        let GetWord = allWords.wordData[wordNumber]
        labelWord.text = GetWord.word
    }
    
    
    func calcScore () {
        percentage = (score/atempt)*100
        let perc = Int(percentage)
        scoreCount.text = "Skóre " + String(perc) + "%"
    }
    
    
    func showCount () {
        
        labelCountWrong.text = String(wrong)
        
        labelCountRight.text = String(right)
        
        
    }
    
    
    func restart() {
        
        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        
        let alert = UIAlertController(title: "Resetovať?", message: "Chystáte sa resetovať vašu aktuálnu hru.", preferredStyle: .alert)
        
        let restartAction = UIAlertAction(title: "Resetovať", style: .default) { (UIAlertAction) in
            self.startOver() }
        
        let cancelAction = UIAlertAction(title: "Zrušiť", style: .cancel) { (UIAlertAction) in
            self.nothing() }
        
        alert.addAction(restartAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        
        
        
        
        
    }
    
    func startOver () {
        
        score = 0
        right = 0
        wrong = 0
        atempt = 0
        percentage = 0
        
        labelCountRight.text = String(right)
        labelCountWrong.text = String(wrong)
        
        scoreCount.text = "Skóre: 0"
        wrongTaps = []
    }
    
    func nothing () {
        
    }
    
    func blink () {
        labelWord.textColor = UIColor.red
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.2 ) {
            self.labelWord.textColor = UIColor.white
        }
        
    }
    
    
    @IBAction func wrongButton(_ sender: Any) {
        
        performSegue(withIdentifier: "passData", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController2
        vc.wrongHitsCount = wrong
        vc.rightHitsCount = right
        vc.scoreCount2 = percentage
        vc.wrongWordsArray = wrongTaps
        vc.score1 = score
        vc.atempt1 = atempt
    }
    
    
    
}


    
    
    
    

