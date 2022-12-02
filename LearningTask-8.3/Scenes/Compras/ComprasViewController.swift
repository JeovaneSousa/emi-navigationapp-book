//
//  LivroSelecionadoViewController.swift
//  LearningTask-8.3
//
//  Created by jeovane.barbosa on 01/12/22.
//

import UIKit

class ComprasViewController: UIViewController {
    
    //Cabecalho Outlets
    @IBOutlet weak var tituloLivroLabel: UILabel!
    @IBOutlet weak var subtituloLivroLabel: UILabel!
    @IBOutlet weak var nomeDoAutorLabel: UILabel!
    @IBOutlet weak var capaDoLivroImageView: UIImageView!
    
    //Compra EBook
    @IBOutlet weak var primeiroTipoLabel: UILabel!
    @IBOutlet weak var primeiroPrecoLabel: UILabel!
    
    //Compra Impresso
    @IBOutlet weak var segundoTipoLabel: UILabel!
    @IBOutlet weak var segundoPrecoLabel: UILabel!
    
    //Compra Ebook + Impresso
    @IBOutlet weak var terceiroTipoLabel: UILabel!
    @IBOutlet weak var terceiroPrecoLabel: UILabel!
    
    var livro: Livro?
    
    override func viewDidLoad() {
        applyTheme()
        setupCabecalho()
        setupBody()
    }
    
    private func setupCabecalho() {
        guard let livro = livro else {return}
        
        tituloLivroLabel.text = livro.titulo
        subtituloLivroLabel.text = livro.subtitulo
        nomeDoAutorLabel.text = livro.autor?.nomeCompleto
        capaDoLivroImageView.image = UIImage(named: livro.imagemDeCapaURI)
    }
    
    private func setupBody(){
        guard let livro = livro else {return}
        primeiroTipoLabel.text = livro.precos[0].texto
        primeiroPrecoLabel.text = livro.precos[0].valorFormatado
        
        segundoTipoLabel.text = livro.precos[1].texto
        segundoPrecoLabel.text = livro.precos[1].valorFormatado
        
        terceiroTipoLabel.text = livro.precos[2].texto
        terceiroPrecoLabel.text = livro.precos[2].valorFormatado
    }

}
