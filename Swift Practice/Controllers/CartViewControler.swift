//
//  CartViewControler.swift
//  Swift Practice
//
//  Created by Aleksas Kasparas on 1/24/22.
//

import UIKit
import RxCocoa
import RxSwift

class CartViewControler: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let booksInCart: BehaviorRelay<[Book]> = ShoppingCart.sharedCart.books
    private let disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCellConfiguration()
    }
    
    
    //MARK: - Rx cell config
    func setupCellConfiguration() {
        booksInCart.bind(to: tableView
                            .rx
                            .items(cellIdentifier: BookCell.cartCellId,
                                   cellType: BookCell.self)) {
            index,
            book,
            cell in
            
            // Populating each cell with data
            cell.setBook(book: book)
            
            // Remove cell on click
            cell.deleteButton.rx.tap.subscribe(onNext: { [weak self] in
                var newListOfBooks = self!.booksInCart.value
                newListOfBooks.remove(at: index)
                self?.booksInCart.accept(newListOfBooks)
            }).disposed(by: cell.bag)
        }.disposed(by: disposeBag)

    }
    
}
