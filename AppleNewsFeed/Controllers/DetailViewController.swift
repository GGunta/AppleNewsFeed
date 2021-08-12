//
//  DetailViewController.swift
//  AppleNewsFeed
//
//  Created by gunta.golde on 12/08/2021.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {

    var savedItems = [Items]()
    var context: NSManagedObjectContext?
    
    var webURLString = String()
    var titleString = String()
    var contentString = String()
    var newsImage: UIImage?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var readFullArticleButton: UIButton!
    @IBOutlet weak var savedButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        readFullArticleButton.layer.cornerRadius = 12
        readFullArticleButton.tintColor = .label
        self.title = "Article"
        
        titleLabel.text = titleString
        contentTextView.text = contentString
        newsImageView.image = newsImage
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
    }
    
    func saveData() {
        do{
            try context?.save()
            basicAlert(title: "Saved!", message: "To see your saved article, go to Saved tab bar.")
        }catch{
            print(error.localizedDescription)
        }
    }
    
    
    @IBAction func savedButtonTapped(_ sender: Any) {
        
        let newItem = Items(context: self.context!)
        newItem.newsTitle = titleString
        newItem.newsContent = contentString
        newItem.url = webURLString
        
        guard let imageData: Data = newsImage?.pngData() else {
            return
        }
        
        if !imageData.isEmpty {
        newItem.image = imageData
    }
        
        self.savedItems.append(newItem)
        saveData()
}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination: WebViewController = segue.destination as! WebViewController
        
        destination.urlString = webURLString
    }

}
