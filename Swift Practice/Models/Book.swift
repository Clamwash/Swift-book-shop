//
//  Item.swift
//  Swift Practice
//
//  Created by Aleksas Kasparas on 12/22/21.
//

import UIKit

struct Book {
    var image: UIImage
    var title: String
    var author: String
    var description: String
    
    init(image: UIImage, title: String, author: String, description: String) {
        self.image = image
        self.title = title
        self.author = author
        self.description = description
    }
}
