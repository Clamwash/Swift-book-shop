//
//  DetailViewController.swift
//  Swift Practice
//
//  Created by Aleksas Kasparas on 12/23/21.
//

import UIKit
import RxCocoa
import RxSwift

class DetailViewController: UIViewController {
    
    var book: Book?
    private let books: BehaviorRelay<[Book]> = ShoppingCart.sharedCart.books
    
    var bookTitle: String?
    var bookAuthor: String?
    var bookImage: UIImage?
    var bookDescription: String?
    
    private var numberOfItemsInCart: Int {
        get {
            return ShoppingCart.sharedCart.books.value.count
        }
    }
    
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var cartButton: UIBarButtonItem!
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        cartButton.title = "\u{1F6D2}" + "(\(numberOfItemsInCart))"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToCart" {
            _ = segue.destination as! CartViewControler
        }
    }
    
    @IBAction func cartButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToCart", sender: self)
    }
    
    @IBAction func addToCartPressed(_ sender: UIButton) {
        addToCart()
        
    }
    
    func addToCart() {
        let count = ShoppingCart.sharedCart.itemCountString
    
        print(count)
     
        
        
 
                if let safeBook = book {
                    books.accept(books.value + [safeBook])
                }
   
        
        cartButton.title = "\u{1F6D2}" + "(\(numberOfItemsInCart))"
    }

    
}
