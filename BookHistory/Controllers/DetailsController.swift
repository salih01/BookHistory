//
//  DetailsController.swift
//  BookHistory
//
//  Created by ALFA on 12.11.2022.
//

import UIKit

class DetailsController: UIViewController {

    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookName: UITextField!
    @IBOutlet weak var bookPage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)

    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    

    @IBAction func kaydetButton(_ sender: Any) {
        
    }
    
}
