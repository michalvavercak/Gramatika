//
//  ViewController2.swift
//  SKGramatika_REAL
//
//  Created by Michal Vavercak on 11/4/18.
//  Copyright © 2018 Michal Vavercak. All rights reserved.
//

import UIKit
import Foundation



class ViewController2: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var wrongWordsArray = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wrongWordsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = wrongWordsArray[indexPath.item]
        return cell
    }
    
    
    
 
    
    
    
    
    
    
    
    
    var wrongHitsCount = Int()
    var rightHitsCount = Int()
    var scoreCount2 = Double()
    var score1 = Double()
    var atempt1 = Double()
    
    
    
    @IBOutlet weak var wrongHits: UILabel!
    
    @IBOutlet weak var rightHits: UILabel!
    
    @IBOutlet weak var scoreCount2label: UILabel!
    
    @IBOutlet weak var continueGame: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var chybyLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        if wrongWordsArray.count == 0 {
            tableView.isHidden = true
            chybyLabel.isHidden = false
        } else {
            tableView.isHidden = false
            chybyLabel.isHidden = true
        }
        
        wrongHits.text = String(wrongHitsCount)
        rightHits.text = String(rightHitsCount)
        if scoreCount2 == 0 {
            scoreCount2label.text = "Skóre: 0"
        } else {
            scoreCount2label.text = "Skóre " + String(Int(scoreCount2)) + "%"
        }
        
        let blur = UIVisualEffectView(effect: UIBlurEffect(style:
            UIBlurEffect.Style.light))
        
        
        
        continueGame.layer.cornerRadius = 0.5 * continueGame.bounds.size.height
        blur.layer.cornerRadius = 0.5 * continueGame.bounds.size.height
        blur.clipsToBounds = true
        blur.frame = continueGame.bounds
        blur.isUserInteractionEnabled = false //This allows touches to forward to the button.
        continueGame.insertSubview(blur, at: 0)
        
        tableView.layer.cornerRadius = 0.06 * tableView.bounds.size.height
    
        
        

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func continueGame(_ sender: Any) {
        performSegue(withIdentifier: "passDataBack", sender: self)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController
        vc.wrong = wrongHitsCount
        vc.right = rightHitsCount
        vc.percentage = Double(scoreCount2)
        vc.wrongTaps = wrongWordsArray
        vc.score = score1
        vc.atempt = atempt1
    }
    
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


    
}


