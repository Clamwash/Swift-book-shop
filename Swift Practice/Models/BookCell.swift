//
//  BookCell.swift
//  Swift Practice
//
//  Created by Aleksas Kasparas on 12/22/21.
//

import UIKit
import RxSwift

class BookCell: UITableViewCell {
    
    
    static let listCellId = "BookCell"
    static let cartCellId = "CartCell"
    
    var bag = DisposeBag()
    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookPrice: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    // Make disposbag empty for reusing cell.
    override func prepareForReuse() {
        super.prepareForReuse()
        bag = DisposeBag()
    }
    
    func setBook(book: Book) {
        bookImageView?.image = book.image
        bookTitle?.text = book.title
        bookAuthor?.text = book.author
        bookPrice?.text = String(format: "%.02f", book.price) + " €"
    }
    
}
