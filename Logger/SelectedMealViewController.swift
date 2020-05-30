//
//  SelectedMealViewController.swift
//  Logger
//
//  Created by Caroline Creamer on 5/21/20.
//  Copyright © 2020 Caroline Creamer. All rights reserved.
//

import UIKit

class SelectedMealViewController: UIViewController {

    @IBOutlet weak var selectedMealLabel: UILabel!
    
    @IBOutlet weak var carbCountLabel: UILabel!
    
    @IBOutlet weak var insulinTakenLabel: UILabel!
    
    @IBOutlet weak var startingBloodSugarLabel: UILabel!
    
    @IBOutlet weak var thirtyMinsLabel: UILabel!
    
    @IBOutlet weak var twoHoursLabel: UILabel!
    
    var selectedMealName = String()
    
    var carbCountName = String()
    
    var insulinTakenName = String()
    
    var thirtyMinsName = String()
    
    var twoHoursName = String()
    
    override func viewWillAppear(_ animated: Bool) {
       selectedMealLabel.text = selectedMealName
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
