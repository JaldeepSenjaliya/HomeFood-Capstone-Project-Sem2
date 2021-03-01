//
//  UserLoginViewController.swift
//  IOS_Final_Project
//
//  Created by user168953 on 3/28/20.
//  Copyright © 2020 user168953. All rights reserved.
//

import UIKit
import CoreData

class UserLoginViewController: UIViewController {
    
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        
       // let userName = username.text
       // let userPassword = password.text
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "UserEntity", into: context)
        
        if (username.text == "" && password.text == ""){
            let alert = UIAlertController(title: "Message", message: "Enter Username or password", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

            self.present(alert, animated: true)
            username.text = ""
            password.text = ""
        }
        else {
        newUser.setValue(username.text, forKey: "username")
        newUser.setValue(password.text, forKey: "password")
        }
        
        
        do{
             try context.save()
        }
        catch{
            print("I/O ERROR")
        }
        print(newUser)
        print("Object Saved.")
        
        performSegue(withIdentifier: "userDetails", sender: self)
        
        let request = NSFetchRequest<NSFetchRequestResult> (entityName: "UserEntity")
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            
            print(results.count)
            
            if (results.count > 0) {
                
                for result in results as! [NSManagedObject]{
                    
                    if let studentname = result.value(forKey: "username") as? String {
                        print(studentname)
                    }
                }
            }
        }
        catch {
            
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.username.text = ""
        self.password.text = ""
    }
    
    
}
