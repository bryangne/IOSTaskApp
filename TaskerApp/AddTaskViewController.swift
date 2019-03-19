//
//  AddTaskViewController.swift
//  TaskerApp
//
//  Created by user149270 on 3/4/19.
//

import UIKit
import CoreData

class AddTaskViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    // MARK: Variables
    var dueDates: [String] = [String]()
    var myDueDate: String?
    // MARK: Outlets
    @IBOutlet weak var descText: UITextField!
    @IBOutlet weak var detailText: UITextView!
    @IBOutlet weak var dueDatePicker: UIPickerView!
    
    // MARK: Actions
    @IBAction func addButton(_ sender: UIButton) {
        let myDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = myDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Task", in: context)!
        let task = NSManagedObject(entity: entity, insertInto: context)
        task.setValue(descText!.text, forKeyPath: "title")
        task.setValue(detailText!.text, forKeyPath: "details")
        task.setValue(myDueDate, forKey: "duedate")
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
        self.dueDatePicker.delegate = self
        self.dueDatePicker.dataSource = self
        dueDates = ["Today", "This Week", "Later"]
        myDueDate = "Today"
    }
    
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    // MARK: Picker View
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dueDates.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dueDates[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myDueDate = dueDates[row]
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
