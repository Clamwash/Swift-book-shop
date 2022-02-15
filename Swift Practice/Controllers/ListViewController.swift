//
//  ViewController.swift
//  Swift Practice
//
//  Created by Aleksas Kasparas on 12/22/21.
//

import UIKit
import RxSwift
import RxCocoa

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cartButton: UIBarButtonItem!
    
    private var book: Book?
    private let books = Observable.just(BookService().createArray())
    
    private var numberOfItemsInCart: Int {
        get {
            return ShoppingCart.sharedCart.books.value.count
        }
    }
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCellConfiguration()
        setupCellTapHandling()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cartButton.title = "\u{1F6D2}" + "(\(numberOfItemsInCart))"
    }
    
}

//MARK: - Segue Preparation

extension ListViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail" {
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.book = self.book
            destinationVC.bookTitle = self.book?.title
            destinationVC.bookAuthor = self.book?.author
            destinationVC.bookImage = self.book?.image
            destinationVC.bookDescription = self.book?.description
        }
        
        if segue.identifier == "goToCart" {
            _ = segue.destination as! CartViewControler
        }
        
        
    }
    
}

//MARK: - Rx Setup

extension ListViewController {
    
    func setupCellConfiguration() {
        books.bind(to: tableView
        .rx
        .items(cellIdentifier: BookCell.listCellId,
               cellType: BookCell.self)) {
            row,
            book,
            cell in cell.setBook(book: book)
        }.disposed(by: disposeBag)
        
       
    }
    
    func setupCellTapHandling() {
        tableView
            .rx
            .modelSelected(Book.self)
            .subscribe(onNext: { [unowned self] selectedBook in
                self.book = selectedBook
                self.performSegue(withIdentifier: "goToDetail", sender: self)
                
                if let selectedRowIndexPath = self.tableView.indexPathForSelectedRow {
                    self.tableView.deselectRow(at: selectedRowIndexPath, animated: true)
                }
            })
            .disposed(by: disposeBag)
    }
    
}

//MARK: - Cart

extension ListViewController {
    @IBAction func cartButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToCart", sender: self)
    }
}








