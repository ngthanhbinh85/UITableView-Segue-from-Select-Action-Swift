//
//  ViewController.swift
//  Example UITableView iOS Swift
//
//  Created by Nguyễn Bình on 8/15/19.
//  Copyright © 2019 Bình Nguyễn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    var myData:[Student] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        myData = MyData.getStudentList()
        
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueShowDetail"
        {
            // Get current selected student
            let selectedStudent = myData[myTableView.indexPathForSelectedRow!.row]

            // Pass it to the DetailViewController
            let controller = segue.destination as! DetailViewController
            controller.student = selectedStudent
        }
        
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let studentName = myData[indexPath.row].name
        
        let myCellID = "myCell"
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: myCellID, for: indexPath)
        
        cell.textLabel?.text = studentName
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
