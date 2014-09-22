//
//  DetailViewController.swift
//  TreatYoSelf
//
//  Created by Sarah Olson on 9/19/14.
//  Copyright (c) 2014 Sarah E Olson. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var notesField: UITextView!
    @IBOutlet weak var recurrenceField: UIPickerView!

    var detailItem: Item? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: Item = self.detailItem {
            if let name = self.nameField {
                name.text = detail.name
                
            }
            if let notes = self.notesField {
                notes.text = detail.information
            }
            if let recurrence = self.recurrenceField {
                //recurrence
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveTapped(sender: AnyObject) {
        
    }

}

