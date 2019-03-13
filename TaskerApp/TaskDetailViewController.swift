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
    @IBOutlet weak var dueDateLabel: UILabel!
    
    // MARK: Variables
    var myTask: NSManagedObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let myTitle = myTask?.value(forKey: "title") as? String
        titleLabel.text = myTitle
        let myDetail = myTask?.value(forKey: "details") as? String
        detailLabel.text = myDetail
        let myDate = myTask?.value(forKey: "duedate") as? Date
        let myDateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "MMM dd, YYYY"
        let myDateString = myDateFormatter.string(from: myDate!)
        dueDateLabel.text = myDateString
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
