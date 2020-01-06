//
//  DetailViewController.swift
//  test2
//
//  Created by Frank Foster on 1/1/20.
//  Copyright © 2020 Frank Foster. All rights reserved.
//

import UIKit
import CoreData


class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var noteText: UITextField!
    
    
   

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.title
            }
            if let text = noteText {
                text.text = detail.title
            }
        }
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
        

        noteText.addTarget(self, action: #selector(self.textFieldChanged(_:)), for: UIControl.Event.editingChanged)
       
    }

    @IBAction func textFieldChanged(_ sender: Any) {
        print(noteText.text!)
    }
    @IBAction func textFieldEndEdit(_ sender: Any) {
        print("edit end")
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        guard let location = NSEntityDescription.insertNewObject(forEntityName: "Event", into: context) as? Event else {
            return
        }

       

        location.title = noteText.text
        
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
  
        
//        ((self.splitViewController?.viewControllers.first as? UINavigationController)?.topViewController as? MasterViewController)?.insertNewObject(self)
        
        
        
    }
    
    
    

        
        
    
    
    var detailItem: Event? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

