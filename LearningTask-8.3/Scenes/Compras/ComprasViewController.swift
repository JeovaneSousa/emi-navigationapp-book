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
    @IBOutlet weak var ebookTipoLabel: UILabel!
    @IBOutlet weak var ebookPrecoLabel: UILabel!
    
    //Compra Impresso
    @IBOutlet weak var impressoTipoLabel: UILabel!
    @IBOutlet weak var impressoPrecoLabel: UILabel!
    
    //Compra Ebook + Impresso
    @IBOutlet weak var comboTipoLabel: UILabel!
    @IBOutlet weak var comboPrecoLabel: UILabel!
    
    var livro: Livro?
    
    override func viewDidLoad() {
        applyTheme()
        setupCabecalho()
        setupBody()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? CarrinhoDeComprasViewController,
              let titulo = livro?.titulo,
              let nomeCompletoAutor = livro?.autor?.nomeCompleto,
              let imagem = livro?.imagemDeCapaURI,
              let ebook = livro?.precos[0],
              let impresso = livro?.precos[1],
              let combo = livro?.precos[2]
        else {return}
        
        switch segue.identifier {
        case "EbookSegue":
            destination.livrosParaCarrinho.append(LivroSelecionadoParaCarrinho(titulo: titulo, nomeAutor: nomeCompletoAutor, preco: ebook, imagemCapaURI: imagem))
        case "ImpressoSegue":
            destination.livrosParaCarrinho.append(LivroSelecionadoParaCarrinho(titulo: titulo, nomeAutor: nomeCompletoAutor, preco: impresso, imagemCapaURI: imagem))
        case "ComboSegue":
            destination.livrosParaCarrinho.append(LivroSelecionadoParaCarrinho(titulo: titulo, nomeAutor: nomeCompletoAutor, preco: combo, imagemCapaURI: imagem))
        default:
            fatalError("Unable to acquire necessary data to complete segue.")
        }
        
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
        
        ebookTipoLabel.text = livro.precos[0].tipoDeLivro.texto
        ebookPrecoLabel.text = livro.precos[0].valor.convertToStringBrCurrency
        
        impressoTipoLabel.text = livro.precos[1].tipoDeLivro.texto
        impressoPrecoLabel.text = livro.precos[1].valor.convertToStringBrCurrency
        
        comboTipoLabel.text = livro.precos[2].tipoDeLivro.texto
        comboPrecoLabel.text = livro.precos[2].valor.convertToStringBrCurrency    }

}
