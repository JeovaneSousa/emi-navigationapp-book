//
//  CarrinhoDeComprasViewController.swift
//  LearningTask-8.3
//
//  Created by jeovane.barbosa on 04/12/22.
//

import UIKit

class CarrinhoDeComprasViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var livrosParaCarrinho: [LivroSelecionadoParaCarrinho] = [] {
        didSet{
            guard let tableView = tableView else {return}
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupViews()
        
        
        // Do any additional setup after loading the view.
    }
    private func setupTableView (){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupViews() {
        tableView.register(CarrinhoSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: CarrinhoSectionHeaderView.reuseId)
    }
}

//MARK: - Implements DataSource
extension CarrinhoDeComprasViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return livrosParaCarrinho.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemDeCompraTableViewCell") as? ItemDeCompraViewCell else {
            fatalError("Unable to acquire cell to present.")
        }
        let livro = livrosParaCarrinho[indexPath.row]
        
        
        cell.livro = livro
        totalLabel.text = livro.preco.valor.convertToStringBrCurrency
        return cell
    }
}

//MARK: - Implements Delegate
extension CarrinhoDeComprasViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: CarrinhoSectionHeaderView.reuseId) as? CarrinhoSectionHeaderView else {
            fatalError("Unable to acquire header view to present.")
        }
        headerView.titulo = "Seu carrinho de compras"

        return headerView
    }
}
