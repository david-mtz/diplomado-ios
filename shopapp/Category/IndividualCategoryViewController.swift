//
//  IndividualCategoryViewController.swift
//  shopapp
//
//  Created by David on 7/23/19.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class IndividualCategoryViewController: UIViewController {

    @IBOutlet weak var productsCollectionView: ProductsCollectionView!
    let  identifierCell = "reuse"
    var products: [Product] = [Product]()
    var category: Category? {
        didSet {
            setUpUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setUpUIForDefaultView()
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        productsCollectionView.register(UINib(nibName: "ProductsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifierCell)
        productsCollectionView.backgroundColor = UIColor.ShopApp.backgroundPage

    }
    
    func setUpUI() {
        if let cat = category {
            navigationItem.title = cat.name
            getData(categoryId: cat.id)
        }
    }
    
    func getData(categoryId: Int) {
        ProductClient.shared.category(categoryId: categoryId) { [weak self] (products) in
            self?.products = products
            self?.productsCollectionView.reloadData()
        }
    }
    
}

extension IndividualCategoryViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierCell, for: indexPath) as? ProductsCollectionViewCell else { return UICollectionViewCell() }
        
        cell.product = products[indexPath.row]
        
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 8
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow:CGFloat = 2
        let spacingBetweenCells:CGFloat = 4
        let totalSpacing = (2 * productsCollectionView.spacingCell) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)
        let width = (collectionView.bounds.width - totalSpacing - productsCollectionView.spacingCell)/numberOfItemsPerRow
        return CGSize(width: width, height: 230)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /*let next = self.storyboard?.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
         next.product = products[indexPath.row]
         navigationController?.pushViewController(next, animated: true)*/
    }
    
}
