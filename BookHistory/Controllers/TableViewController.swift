//
//  TableViewController.swift
//  BookHistory
//
//  Created by ALFA on 12.11.2022.
//

import UIKit
import CoreData

extension TableViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = bookNameArray[indexPath.row]
        
        cell.contentConfiguration = content
        
        
        
        return cell
    }
    
    
}


class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var bookNameArray = [String]()
    var idArray = [UUID]()
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
      
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name("newData"), object: nil)
    }
    
    
    @objc func getData(){
        
        bookNameArray.removeAll()
        idArray.removeAll()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Books")
        
        fetchRequest.returnsObjectsAsFaults = false
        
        
        
        do {
            let results = try context.fetch(fetchRequest)
            
            for result in results as! [NSManagedObject] {
                if let name =  result.value(forKey: "bookName") as? String {
                    
                    self.bookNameArray.append(name)
                }
                
                if let id = result.value(forKey: "id") as? UUID {
                    self.idArray.append(id)
                }
                
                self.tableView.reloadData()
                
            }

        } catch{
            
        }
        
        
        
    }
    
 
    
    
    
    @IBAction func detailsBarButton(_ sender: Any) {
        
        performSegue(withIdentifier: "toDetails", sender: nil)
    }
    
}
