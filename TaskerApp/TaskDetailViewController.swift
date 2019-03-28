//
//  TaskViewController.swift
//  TaskerApp
//
//  Created by Mac Pro 3 on 2019-03-12.
//

import UIKit
import CoreData

class TaskDetailViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UITextView!
    @IBOutlet weak var completedButton: UIButton!
    
    // MARK: Variables
    var myTask: NSManagedObject?
    var myTitle: String?
    var myDetail: String?
    var hideCompleted: Bool = false
    
    // MARK: Actions
    @IBAction func completedButtonAction(_ sender: UIButton) {
        // Set the task to completed
        let myDelegate = UIApplication.shared.delegate as? AppDelegate
        let myContext = myDelegate?.persistentContainer.viewContext
        myTask?.setValue(true, forKey: "completed")
        do {
            try myContext?.save()
        } catch {
            print("Error! Cant save!")
        }
        hideCompleted = false
        _ = navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTitle = myTask?.value(forKey: "title") as? String
        titleLabel.text = myTitle
        myDetail = myTask?.value(forKey: "details") as? String
        detailLabel.text = myDetail
        completedButton.isHidden = hideCompleted
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showTaskEdit" {
            let detailVC = segue.destination as! AddTaskViewController
//            detailVC.addButton.isHidden = false
//            detailVC.addButton.setTitle("Edit", for: .normal)
            detailVC.myTitle = self.myTitle
            detailVC.myDetail = self.myDetail
            
        }
    }

}
