//
//  ResultsViewController.swift
//  shopapp
//
//  Created by David on 8/4/19.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var name: String = ""
    var categoryId: String = ""
    var products: [Product]? {
        didSet {
            updateData()
        }
    }
    let identifierCell = "rehuse"
    @IBOutlet weak var productsCollectionView: ProductsCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setUpUIForDefaultView()
        setUp()

        // Do any additional setup after loading the view.
    }
    
    func setUp() {
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        productsCollectionView.register(UINib(nibName: "ProductsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifierCell)
        productsCollectionView.backgroundColor = UIColor.ShopApp.backgroundPage
        title = name
        loadData()
    }
    
    func loadData() {
        var query = ["name": name, "categoryId": categoryId]
        ProductClient.shared.search(query: query) { [weak self] (products) in
            guard let strongSelf = self else { return }
            self?.products = products
        }
    }
    
    func updateData() {
        productsCollectionView.reloadData()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ResultsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let products = self.products else { return 0 }
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierCell, for: indexPath) as? ProductsCollectionViewCell, let products = self.products else { return UICollectionViewCell() }
        
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
        guard let products = self.products else { return }
        let next = IndividualProductViewController(nibName: "IndividualProductViewController", bundle: nil)
        next.product = products[indexPath.row]
        navigationController?.pushViewController(next, animated: true)
    }
    
}
