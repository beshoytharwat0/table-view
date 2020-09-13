//
//  ViewController.swift
//  Table
//
//  Created by Mac on 9/5/20.
//  Copyright © 2020 beshoy tharwat. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var elementTextFeild: UITextField!
    @IBOutlet weak var indexTextField: UITextField!
    var itemArray = [String?]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return itemArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        indexTextField.keyboardType = .numberPad
    }
    
    
    
    
    @IBAction func add(_ sender: UIButton) {
        if itemArray.count == 0 {
            itemArray.insert(elementTextFeild.text, at: 0)
           tableView.reloadData()
//       insertElementAtIndex(element: elementTextFeild.text, index: 0)
//            print(itemArray)
        }else if itemArray.count >= 1 && (indexTextField.text?.isEmpty)!{
            itemArray.insert(elementTextFeild.text, at: 1)
            tableView.reloadData()
        }else {
            
            insertElementAtIndex(element: elementTextFeild.text, index: integer(from: indexTextField)-1)
            tableView.reloadData()
        }
        
    }
    func insertElementAtIndex(element: String?, index: Int) {

        while itemArray.count <= index {
            itemArray.append("")
            tableView.reloadData()
        }

        itemArray.insert(element, at: index)
    }
    
    func integer(from textField: UITextField) -> Int {
        guard let text = textField.text, let indexnumber = Int(text) else {
            return 0
        }
        return indexnumber
    }

}

