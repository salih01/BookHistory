//
//  DetailsController.swift
//  BookHistory
//
//  Created by ALFA on 12.11.2022.
//

import UIKit
import CoreData

extension DetailsController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        self.bookImage.image = info[.originalImage] as? UIImage
        
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
        bookImage.addGestureRecognizer(imageTapGesture)
        bookImage.isUserInteractionEnabled = true
       
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc func selectImage(){
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        self.present(picker, animated: true)
    }
    

    
    // MARK: - Actions

    @IBAction func kaydetButton(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let newBook = NSEntityDescription.insertNewObject(forEntityName: "Books", into: context)
        
        
        if bookName.text != "" && bookPage.text != "" {
            
            if let bookSayfa = Int(bookPage.text!){
                newBook.setValue(bookSayfa, forKey: "bookPage")

            }
          
            newBook.setValue(bookName.text!, forKey: "bookName")
            newBook.setValue(UUID(), forKey: "id")
            let jpegImage = bookImage.image!.jpegData(compressionQuality: 0.8)
            newBook.setValue(jpegImage, forKey: "image")
            
            do {
                try context.save()
            }  catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
            
            
            NotificationCenter.default.post(name: NSNotification.Name("newData"), object: nil)
            self.navigationController?.popViewController(animated: true)
        } else
        {
            print("hata")
        }
        
       
        
    }
    
}
