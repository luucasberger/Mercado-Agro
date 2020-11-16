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
    let category: String
    
    init(text: String, imageName: String, price: String, category: String) {
        self.text = text
        self.imageName = imageName
        self.price = price
        self.category = category
        
    }
}

struct ProductDefaults {
    static let categories = ["Maquinaria agrícola", "Vehículos", "Instalaciones e infraestructura", "Equipamientos y herramientas", "Insumos agrícolas", "Campos e inmuebles", "Maquinaria vial", "Seguros agrícolas e integrales", "Insumos para ganadería", "Repuestos", "Agricultura de precisión", "Créditos y financiación", "Equinos", "Suinos", "Vacunos", "Caprinos", "Aves"]
    
    static let currency = ["US$", "$"]
}
