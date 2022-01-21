//
//  DetailViewController.swift
//  Swift Practice
//
//  Created by Aleksas Kasparas on 12/23/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    var bookTitle: String?
    var bookAuthor: String?
    var bookImage: UIImage?
    var bookDescription: String?
    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookAuthorLabel: UILabel!
    @IBOutlet weak var bookDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookTitleLabel.text = bookTitle
        bookAuthorLabel.text = bookAuthor
        bookImageView.image = bookImage
        bookDescriptionLabel.text = bookDescription
    }
}
