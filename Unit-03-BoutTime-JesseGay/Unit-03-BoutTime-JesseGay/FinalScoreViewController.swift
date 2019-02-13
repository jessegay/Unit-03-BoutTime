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
        
//        "\(myGameManager.correctResponses) / \(myGameManager.roundsPerGame)"
        // resultsStack.isHidden = false
    }
    
    // MARK: Actions
    
    @IBAction func playAgain(_ sender: Any) {
        // reset parameters. Can I do that from here?
        
        // Navigate back to first VC
        performSegue(withIdentifier: "goBack", sender: nil)
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
