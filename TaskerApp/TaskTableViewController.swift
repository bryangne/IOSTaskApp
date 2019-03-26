//
//  TaskTableViewController.swift
//  TaskerApp
//
//  Created by Mac Pro 3 on 2019-03-25.
//

import UIKit
import CoreData

class TaskTableViewController: UITableViewController {

    var tasks: [NSManagedObject] = []
    var selectedTask: NSManagedObject?
    var daySelect = "Today"
    var completedSelect = false
    //MARK: Outlets
    
    // MARK: My Functions
    func clearData() {
        let myDelegate = UIApplication.shared.delegate as? AppDelegate
        let myContext = myDelegate?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try myContext!.execute(deleteRequest)
        } catch let error as NSError {
            print(error)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let myDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = myDelegate?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Task")
        // Fetch the data based on which tab was selected
        let datePredicate = NSPredicate(format: "due == %@", daySelect)
//        let compPredicate = NSPredicate(format: "completed == %@", completedSelect)
//        fetchRequest.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [datePredicate, compPredicate])
        fetchRequest.predicate = datePredicate
        do {
            tasks = try (context?.fetch(fetchRequest))!
        } catch let error as NSError {
            print(error)
        }
        
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        // self.clearData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }
    

    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */

    // MARK: - Navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
         if segue.identifier == "showTaskDetail" {
             let detailVC = segue.destination as! TaskDetailViewController
             let indexPath = tableView.indexPathForSelectedRow
             detailVC.myTask = tasks[indexPath!.row]
         }
     // Pass the selected object to the new view controller.
     }


}
