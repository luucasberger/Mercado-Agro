//
//  ModelP.swift
//  Mercado Agro
//
//  Created by Lucas Berger on 10/31/20.
//

import UIKit

struct ModelP {
    let text: String
    let imageName: String
    let price: String
    
    init(text: String, imageName: String, price: String) {
        self.text = text
        self.imageName = imageName
        self.price = price
    }
}
