//
//  Livro.swift
//  LearningTask-8.3
//
//  Created by rafael.rollo on 23/06/2022.
//

import Foundation

struct Livro {
    let titulo: String
    let subtitulo: String
    let imagemDeCapaURI: String
    let autor: Autor?
    let precos: [Preco]
    
    init(titulo: String, subtitulo: String, imagemDeCapaURI: String, autor: Autor? = nil, precos: [Preco]) {
        self.titulo = titulo
        self.imagemDeCapaURI = imagemDeCapaURI
        self.autor = autor
        self.subtitulo = subtitulo
        self.precos = precos
    }
}

struct Preco {
    let valor: Decimal
    let tipoDeLivro: TipoDeLivro
    
//    var valorFormatado: String {
//        switch tipoDeLivro {
//        case .ebook:
//            return "R$ \(self.valor)0"
//        case .impresso:
//            return "R$ \(self.valor)0"
//        case .combo:
//            return "R$ \(self.valor)0"
//        }
//    }
    var texto: String {
        switch tipoDeLivro {
        case .ebook:
            return "E-book*"
        case .impresso:
            return "Impresso"
        case .combo:
            return "E-book + Impresso"
        }
    }
    
    enum TipoDeLivro{
        case ebook, impresso, combo
    }
}
