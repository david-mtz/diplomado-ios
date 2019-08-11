//
//  SearchViewController.swift
//  shopapp
//
//  Created by David on 8/3/19.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var resultTableView: UITableView!
    @IBOutlet weak var showAllButton: UIButton!
    var results: [Product] = [Product]()
    let rehuseId = "rehuse"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        resultTableView.delegate = self
        resultTableView.dataSource = self
        resultTableView.register(UINib(nibName: "ProductResultTableViewCell", bundle: nil), forCellReuseIdentifier: rehuseId)
        setUpUI()
        // Do any additional setup after loading the view.
    }
    
    func setUpUI() {
        resultTableView.backgroundColor = UIColor.ShopApp.backgroundPage
        let textFieldInsideSearchBar = searchBar.value(forKey: "_searchField") as? UITextField
        textFieldInsideSearchBar?.layer.borderWidth = 2.0
        textFieldInsideSearchBar?.layer.cornerRadius = 5.0
        textFieldInsideSearchBar?.layer.borderColor = UIColor.ShopApp.yellow.cgColor
    }

    
    @IBAction func viewAllButonAction(_ sender: UIButton) {
        let next = ResultsViewController(nibName: "ResultsViewController", bundle: nil)
        next.name = searchBar.text ?? ""        
        navigationController?.pushViewController(next, animated: true)
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

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.count > 3 {
            var queryParams: [String: String] = [
                "name": searchText,
                "results": "3"
            ]
            
            ProductClient.shared.search(query: queryParams) { [weak self] (results) in
                guard let strongSelf = self else { return }
                strongSelf.results = results
                strongSelf.resultTableView.reloadData()
                strongSelf.showAllButton.isHidden = (results.count > 0) ? false : true
            }
            
        } else {
            results = []
            resultTableView.reloadData()
            showAllButton.isHidden = true
        }
        
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: rehuseId, for: indexPath) as? ProductResultTableViewCell else {
            return UITableViewCell()

        }
        cell.separatorInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 10)
        cell.product = results[indexPath.row]
        cell.uploadView()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let next = IndividualProductViewController(nibName: "IndividualProductViewController", bundle: nil)
        next.product = results[indexPath.row]
        navigationController?.pushViewController(next, animated: true)
    }

    
}
