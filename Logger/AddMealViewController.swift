//
//  AddMealViewController.swift
//  Logger
//
//  Created by Caroline Creamer on 5/21/20.
//  Copyright © 2020 Caroline Creamer. All rights reserved.
//

import UIKit

class AddMealViewController: UIViewController {

    @IBOutlet weak var addFoodField: UITextField!
    
    
    @IBOutlet weak var carbCountField: UITextField!
    
    @IBOutlet weak var unitsInsulinField: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    @IBAction func submitButton(_ sender: Any) {
        textView.text = "Food: \(addFoodField.text!)\nCarb Count: \(carbCountField.text!)\nUnits of Insulin: \(unitsInsulinField.text!)"
        
        performSegue(withIdentifier: "submitButton", sender: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addFoodField.delegate = self
        
        carbCountField.delegate = self
        
        unitsInsulinField.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        carbCountField.resignFirstResponder()
        
        unitsInsulinField.resignFirstResponder()
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

extension AddMealViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
