//
//  ItemDeCompraViewCell.swift
//  LearningTask-8.3
//
//  Created by jeovane.barbosa on 04/12/22.
//

import UIKit

class ItemDeCompraViewCell: UITableViewCell {
    
    @IBOutlet weak var capaDoLivroImageView: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var nomeDoAutorLabel: UILabel!
    @IBOutlet weak var tipoDeCompraLabel: UILabel!
    @IBOutlet weak var precoLabel: UILabel!
    
    var livro: LivroSelecionadoParaCarrinho? {
        didSet{
            guard let livro = livro else {return}
            capaDoLivroImageView.image = UIImage(named: livro.imagemCapaURI)
            tituloLabel.text = livro.titulo
            nomeDoAutorLabel.text = livro.nomeAutor
            tipoDeCompraLabel.text = livro.preco.tipoDeLivro.texto
            precoLabel.text = livro.preco.valor.convertToStringBrCurrency
        }
    }

}
