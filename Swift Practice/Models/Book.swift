//
//  Item.swift
//  Swift Practice
//
//  Created by Aleksas Kasparas on 12/22/21.
//

import UIKit

struct Book: Hashable {
//    var id: Int
    var image: UIImage
    var title: String
    var author: String
    var description: String
    var price: Double
    
    init(image: UIImage, title: String, author: String, description: String, price: Double) {

        self.image = image
        self.title = title
        self.author = author
        self.description = description
        self.price = price
    }
}

struct ProductOrder {
    var product: Book
    var quanity: Int
}

enum CartAction {
    case add(product: Book)
    case incrementOrder(withProductId: Int)
    case decrementOrder(withProductId: Int)
    case clear
}
