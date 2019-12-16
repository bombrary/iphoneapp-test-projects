//
//  ViewController.swift
//  PageViewControllerTest
//
//  Created by Riku_Yamamoto on 2019/12/14.
//  Copyright © 2019 Riku_Yamamoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: Any) {
        let stb = UIStoryboard(name: "Walkthrough", bundle :nil)
        let pageVC = stb.instantiateViewController(withIdentifier: "walk")
        pageVC.modalPresentationStyle = .currentContext
        present(pageVC, animated: true, completion: nil)
    }
    
}

