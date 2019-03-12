//
//  AddTaskViewController.swift
//  TaskerApp
//
//  Created by user149270 on 3/4/19.
//

import UIKit
import CoreData

class AddTaskViewController: UIViewController, UITextFieldDelegate {
    // MARK: Variables
    
    // MARK: Outlets
    @IBOutlet weak var descText: UITextField!
    @IBOutlet weak var detailText: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK: Actions
    @IBAction func addButton(_ sender: UIButton) {
        let myDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = myDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Task", in: context)!
        let task = NSManagedObject(entity: entity, insertInto: context)
        task.setValue(descText!.text, forKeyPath: "title")
        task.setValue(detailText!.text, forKeyPath: "details")
        task.setValue(0, forKeyPath: "overdue")
        do {
            try context.save()
        } catch let error as NSError {
            print(error)
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descText.delegate = self as? UITextFieldDelegate
        detailText.delegate = self as? UITextViewDelegate
        
        /*
        let myDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = myDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "DayTask", in: context)!
        let task = NSManagedObject(entity: entity, insertInto: context)
        task.setValue("test", forKeyPath: "title")
        do {
            try context.save()
        } catch let error as NSError {
            print(error)
        }
         */
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
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
