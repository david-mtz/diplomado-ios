//
//  CustoTabBarViewController.swift
//  shopapp
//
//  Created by David on 7/20/19.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class CustomTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        setUpUI()
    }
    
    func setUpUI() {
        if let items = self.tabBar.items {
            for item in items {
                if let image = item.image {
                    item.image = image.withRenderingMode(.alwaysOriginal)
                    if let titleName = item.title?.lowercased() {
                        item.selectedImage = UIImage(named: "\(titleName)-selected")?.withRenderingMode(.alwaysOriginal)
                        
                    }
                }
            }
        }
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
