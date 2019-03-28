//
//  AddTaskViewController.swift
//  TaskerApp
//
//  Created by user149270 on 3/4/19.
//

import UIKit
import CoreData

class AddTaskViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    // MARK: Variables
    var myDueDate: String?
    var dueDates: [String] = [String]()
    var myDetail : String?
    var myTitle: String?
    var showAddButton: Bool = true
    
    // MARK: Outlets
    @IBOutlet weak var descText: UITextField!
    @IBOutlet weak var detailText: UITextView!
    @IBOutlet weak var dueDatePicker: UIPickerView!
    @IBOutlet weak var addButton: UIButton!
    
    
    // MARK: Actions
    @IBAction func addButtonAction(_ sender: UIButton) {
        let myDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = myDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Task", in: context)!
        let task = NSManagedObject(entity: entity, insertInto: context)
        task.setValue(descText!.text, forKeyPath: "title")
        task.setValue(detailText!.text, forKeyPath: "details")
        task.setValue(myDueDate, forKeyPath: "due")
        task.setValue(0, forKeyPath: "overdue")
        task.setValue(false, forKeyPath: "completed")
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
        self.dueDatePicker.delegate = self as? UIPickerViewDelegate
        self.dueDatePicker.dataSource = self as? UIPickerViewDataSource
        dueDates = ["Today", "This Week", "Later"]
        descText.text = myTitle
        detailText.text = myDetail
        
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
    
    //MARK: Picker
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dueDates.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.myDueDate = dueDates[row]
        return dueDates[row]
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
