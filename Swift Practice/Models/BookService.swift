//
//  File.swift
//  Swift Practice
//
//  Created by Aleksas Kasparas on 12/23/21.
//

import UIKit

struct BookService {
    func createArray() -> [Book] {
        
        let bookArray: [Book] = [
            Book(image: UIImage(named: "potter")!, title: "Harry Potter", author: "J.K. Rowling", description: "Harry Potter is a series of seven fantasy novels written by British author J. K. Rowling. The novels chronicle the lives of a young wizard, Harry Potter, and his friends Hermione Granger and Ron Weasley, all of whom are students at Hogwarts School of Witchcraft and Wizardry."),
            Book(image: UIImage(named: "putin")!, title: "Vladimir Putin: Life Coach", author: "Rob Sears", description: "What can the rise and reign of this century's most feared politician teach us about life, work and love? Rob Sears shows how the machinations that enabled Putin to dominate the Kremlin and undermine the United States of America could also help you take control of your mundane life"),
            Book(image: UIImage(named: "sisyphus")!, title: "The Myth of Sisyphus", author: "Albert Camus", description: "Camus uses the Greek legend of Sisyphus, who is condemned by the gods for eternity to repeatedly roll a boulder up a hill only to have it roll down again once he got it to the top, as a metaphor for the individual's persistent struggle against the essential absurdity of life"),
            Book(image: UIImage(named: "flow")!, title: "Flow", author: "Mihaly Csikszentmihalyi", description: "The book talks about the state of \"flow\", or optimal experience. It is basically a state of mind where one is so involved in activity \"that nothing else matters."),
            Book(image: UIImage(named: "nietzche")!, title: "Thus Spoke Zarathustra", author: "Friedrich Nietzche", description: "It describes how the ancient Persian prophet Zarathustra descends from his solitude in the mountains to tell the world that God is dead and that the Superman, the human embodiment of divinity, is his successor.")
            
        ]
        return bookArray
    }
}
