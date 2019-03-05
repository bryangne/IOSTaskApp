//
//  AddTaskViewController.swift
//  TaskerApp
//
//  Created by user149270 on 3/4/19.
//

import UIKit
import CoreData

class AddTaskViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
        // Do any additional setup after loading the view.
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
