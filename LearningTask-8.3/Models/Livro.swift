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
    

}

enum TipoDeLivro{
    case ebook, impresso, combo
    
    var texto: String {
        switch self {
        case .ebook:
            return "E-book*"
        case .impresso:
            return "Impresso"
        case .combo:
            return "E-book + Impresso"
        }
    }
}

struct LivroSelecionadoParaCarrinho {
    let titulo: String
    let nomeAutor: String
    let preco: Preco
    let imagemCapaURI: String
    
    
    init(titulo: String, nomeAutor: String, preco: Preco, imagemCapaURI: String) {
        self.titulo = titulo
        self.nomeAutor = nomeAutor
        self.preco = preco
        self.imagemCapaURI = imagemCapaURI
    }
}
