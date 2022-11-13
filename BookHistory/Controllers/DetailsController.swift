//
//  DetailsController.swift
//  BookHistory
//
//  Created by ALFA on 12.11.2022.
//

import UIKit

extension DetailsController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.originalImage]
        bookImage.image = image as? UIImage
        dismiss(animated: true)

        
    }
    
}


class DetailsController: UIViewController {
    
    // MARK: - UI Elements
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookName: UITextField!
    @IBOutlet weak var bookPage: UITextField!
   
    
    // MARK: - Properties
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gesture()

    }
    
    // MARK: - Functions
    
  
    func gesture() {
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        let imageTapGesture = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        view.addGestureRecognizer(imageTapGesture)
       
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc func selectImage(){
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        present(picker, animated: true)
    }
    

    
    // MARK: - Actions

    @IBAction func kaydetButton(_ sender: Any) {
        
    }
    
}
