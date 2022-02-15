//
//  ShoppingCart.swift
//  Swift Practice
//
//  Created by Aleksas Kasparas on 1/26/22.
//

import UIKit
import RxCocoa
import RxSwift

struct ShoppingCart {
    static let sharedCart = ShoppingCart()
    let books: BehaviorRelay<[Book]> = BehaviorRelay(value: [])
    

    
    var itemCountString: String {
        //Unique the books
        let setOfBooks = Set<Book>(books.value)

        //Check how many of each exists
        let itemStrings: [String] = setOfBooks.map { book in
            let count: Int = books.value.reduce(0, {
                runningTotal, reduceBook in
                if book == reduceBook {
                    return runningTotal + 1
                }
                return runningTotal
            })


            print(count)
            return "Count: \(count)"
        }
        return itemStrings.joined()
    }
}
