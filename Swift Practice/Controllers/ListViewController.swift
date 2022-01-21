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
    
    let books = Observable.just(BookService().createArray())
    private let disposeBag = DisposeBag()
    
    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCellConfiguration()
        setupCellTapHandling()
    }
    
}

extension ListViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail" {
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.bookTitle = self.book?.title
            destinationVC.bookAuthor = self.book?.author
            destinationVC.bookImage = self.book?.image
            destinationVC.bookDescription = self.book?.description
        }
    }
    
}

//MARK: - Rx Setup

extension ListViewController {
    
    func setupCellConfiguration() {
        books.bind(to: tableView
        .rx
        .items(cellIdentifier: BookCell.Identifier,
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




