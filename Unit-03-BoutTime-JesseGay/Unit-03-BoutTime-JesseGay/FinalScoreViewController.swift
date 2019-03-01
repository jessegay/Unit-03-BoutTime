//
//  FinalScoreViewController.swift
//  Unit-03-BoutTime-JesseGay
//
//  Created by Jesse Gay on 2/12/19.
//  Copyright © 2019 Jesse Gay. All rights reserved.
//

import UIKit

class FinalScoreViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var finalScore: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    var score = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        finalScore.text = score
    }
    
    // MARK: Actions
    
    @IBAction func playAgain(_ sender: Any) {

        // Navigate back to first VC
        performSegue(withIdentifier: "goBack", sender: nil)
    }
}
