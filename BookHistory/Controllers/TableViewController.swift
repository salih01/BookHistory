//
//  TableViewController.swift
//  BookHistory
//
//  Created by ALFA on 12.11.2022.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
    }
    
    
    @IBAction func detailsBarButton(_ sender: Any) {
        
        performSegue(withIdentifier: "toDetails", sender: nil)
    }
    
}
