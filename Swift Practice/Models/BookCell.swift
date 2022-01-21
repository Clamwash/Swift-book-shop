//
//  BookCell.swift
//  Swift Practice
//
//  Created by Aleksas Kasparas on 12/22/21.
//

import UIKit

class BookCell: UITableViewCell {
    
    static let Identifier = "BookCell"

    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    
    func setBook(book: Book) {
        bookImageView.image = book.image
        bookTitle.text = book.title
        bookAuthor.text = book.author
    }
    
}
