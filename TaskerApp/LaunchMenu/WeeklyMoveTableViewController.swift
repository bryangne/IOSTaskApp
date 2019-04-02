//
//  WeeklyMoveTableViewController.swift
//  TaskerApp
//
//  Created by Mac Pro 2 on 2019-04-03.
//

import UIKit

class WeeklyMoveTableViewController: TaskTableViewController {
    
    var taskSelect: [Bool]?
    
    // MARK: Actions
    @IBAction func nextButtonAction(_ sender: UIBarButtonItem) {
        let myDelegate = UIApplication.shared.delegate as? AppDelegate
        let myContext = myDelegate?.persistentContainer.viewContext
        print(taskSelect!)
        for i in 0...taskSelect!.count-1 {
            print(i)
            if taskSelect![i] == true {
                tasks[i].setValue("Today", forKey: "due")
            }
        }
        do {
            try myContext?.save()
        } catch {
            print("Error! Cant save!")
        }
        UserDefaults.standard.set(Date(), forKey: "oldDate")
        performSegue(withIdentifier: "showAfterSelect", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        daySelect = "This Week"
        completedSelect = false
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        taskSelect = Array(repeating: false, count: tasks.count)
    }

    // MARK: - Table view data source

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! WeeklyMoveTableViewCell
        // Configure the cell...
        cell.layoutMargins = UIEdgeInsets.zero
        let text = tasks[indexPath.row].value(forKeyPath: "title") as? String
        cell.taskLabel.text = text
        if taskSelect![indexPath.row] == true {
            cell.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        }
        else {
            cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        taskSelect![indexPath.row] = !taskSelect![indexPath.row]
        self.tableView.reloadData()
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
