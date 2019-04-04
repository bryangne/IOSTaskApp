//
//  loadCheckViewController.swift
//  TaskerApp
//
//  Created by Mac Pro 2 on 2019-04-01.
//

import UIKit

class loadCheckViewController: UIViewController {
    var newDay: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        checkNewDay()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if newDay {
            performSegue(withIdentifier: "showNewDaySelect", sender: self)
        }
        else {
            performSegue(withIdentifier: "showTaskList", sender: self)
        }
        
        
    }
    
    func checkNewDay() {
        let oldDate = UserDefaults.standard.object(forKey: "oldDate") as? Date
        if (oldDate == nil) {
            UserDefaults.standard.set(Date(), forKey: "oldDate")
            print("No date yet")
            return
        }
        if !Calendar.current.isDateInToday(oldDate!) {
            UserDefaults.standard.set(Date(), forKey: "oldDate")
            print("New day!")
            newDay = true
        }
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
