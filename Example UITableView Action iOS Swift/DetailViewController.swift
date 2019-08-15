//
//  DetailViewController.swift
//  Example UITableView iOS Swift
//
//  Created by Nguyễn Bình on 8/15/19.
//  Copyright © 2019 Bình Nguyễn. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var textViewStudentInfo: UITextView!
    
    var student: Student?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let info = student {
            textViewStudentInfo.text =  "ID: " + info.id + "\n" + "Name: " + info.name + "\n" + "Address: " + info.address
        }
        
    }

    @IBAction func DoneTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
