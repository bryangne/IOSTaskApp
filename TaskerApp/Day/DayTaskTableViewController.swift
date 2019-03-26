//
//  DayTaskTableViewController.swift
//  TaskerApp
//
//  Created by user149270 on 3/4/19.
//

import UIKit
import CoreData

class DayTaskTableViewController: TaskTableViewController {
    
    
    //MARK: Actions
    @IBAction func addTask(_ sender: UIBarButtonItem) {
    }
    @IBAction func clearDataButton(_ sender: UIButton) {
        self.clearData()
    }
    @IBAction func printDataButton(_ sender: UIBarButtonItem) {
        for task in tasks {
            print(task.value(forKey: "due") as? String)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set what data to show
        daySelect = "Today"
        completedSelect = false
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! DayTaskTableViewCell
        // Configure the cell...
        cell.layoutMargins = UIEdgeInsets.zero
        let text = tasks[indexPath.row].value(forKeyPath: "title") as? String
        cell.taskLabel.text = text
        return cell
    }

    // MARK: - Table view data source

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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
}
