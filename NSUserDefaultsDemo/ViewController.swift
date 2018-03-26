//
//  ViewController.swift
//  NSUserDefaultsDemo
//
//  Created by Appinventiv on 26/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var addressText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var mobileNumberText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func submitBtnTapped(_ sender: UIButton) {
        if !(nameText.text?.isEmpty)! && !(lastNameText.text?.isEmpty)! && !(mobileNumberText.text?.isEmpty)! && !(emailText.text?.isEmpty)! && !(addressText.text?.isEmpty)! {
        if let name=nameText.text, let lastName=lastNameText.text,let mobile=mobileNumberText.text, let email=emailText.text,let address=addressText.text{
            NSUserDefaults.save(name, forKey:AppUserDefaultKeys.name)
            NSUserDefaults.save(lastName, forKey: AppUserDefaultKeys.lastName)
            NSUserDefaults.save(mobile, forKey: AppUserDefaultKeys.mobile)
            NSUserDefaults.save(email, forKey: AppUserDefaultKeys.email)
            NSUserDefaults.save(address, forKey: AppUserDefaultKeys.address)
            print("Data Saved")
            self.clear()
        }
    }
        else{
            let alert = UIAlertController(title: "Alert", message: "No field can be left Blank", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                }
            }))
        }
        
        
    }
    
    
    @IBAction func fetchBtnTapped(_ sender: UIButton) {
        nameText.text = NSUserDefaults.retrieveStringValue(AppUserDefaultKeys.name)
        lastNameText.text = NSUserDefaults.retrieveStringValue(AppUserDefaultKeys.lastName)
        mobileNumberText.text = NSUserDefaults.retrieveStringValue(AppUserDefaultKeys.mobile)
        emailText.text = NSUserDefaults.retrieveStringValue(AppUserDefaultKeys.email)
        addressText.text = NSUserDefaults.retrieveStringValue(AppUserDefaultKeys.address)
    }
    
    func clear(){
        nameText.text = ""
        lastNameText.text = ""
        mobileNumberText.text = ""
        emailText.text = ""
        addressText.text = ""
    }
    
}

