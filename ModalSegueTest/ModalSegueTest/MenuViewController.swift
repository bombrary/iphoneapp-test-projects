//
//  MenuViewController.swift
//  ModalSegueTest
//
//  Created by Riku_Yamamoto on 2019/12/14.
//  Copyright © 2019 Riku_Yamamoto. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var menuView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let menuPosY = menuView.layer.position.y
        menuView.layer.position.y += menuView.layer.frame.height
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: .curveEaseOut,
            animations: {
                self.menuView.layer.position.y = menuPosY
        },
            completion: nil)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if touch.view?.tag == 1 {
                UIView.animate(
                    withDuration: 0.2,
                    delay: 0,
                    options: .curveEaseOut,
                    animations: {
                        self.menuView.layer.position.y += self.menuView.layer.frame.height
                }) { bool in
                    self.dismiss(animated: bool, completion: nil)
                }
            }
        }
    }
 
    @IBAction func dstOneTapped(_ sender: Any) {
        let navController = presentingViewController as! UINavigationController
        dismiss(animated: true) {
            let sb = UIStoryboard(name: "Dest1", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "dest1")
            navController.pushViewController(vc, animated: true)
        }
    }
    @IBAction func dstTwoTapped(_ sender: Any) {
        let navController = presentingViewController as! UINavigationController
        dismiss(animated: true) {
            let sb = UIStoryboard(name: "Dest2", bundle: nil)
            guard let vc = sb.instantiateInitialViewController() else {
                print("View Controller is not found.")
                return
            }
            navController.pushViewController(vc, animated: true)
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
