//
//  ViewController.swift
//  GestureRecognizerTest
//
//  Created by Riku_Yamamoto on 2019/12/15.
//  Copyright © 2019 Riku_Yamamoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var items = ["items-1", "items-2", "items-3", "items-4", "items-5"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(TestCell.self, forCellReuseIdentifier: "testCell")
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell") as! TestCell
        cell.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(cellPanned(_:))))
        cell.label.text = items[indexPath.row]
        return cell
    }
    
    
    @objc func cellPanned(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            panBegan(sender)
        case .changed:
            panChanged(sender)
        case .ended:
            panEnded(sender)
        default: break
        }
    }
    
    func panBegan(_ sender: UIPanGestureRecognizer) {
        // 必要なら何か処理を書く
    }
    func panChanged(_ sender: UIPanGestureRecognizer) {
        let cell = sender.view as! TestCell
        let x = cell.layer.position.x
        let dx = sender.translation(in: self.view).x
        if dx < 0 {
            cell.overlay.layer.position.x = x + dx
        }
        if abs(dx) > cell.frame.width / 4 {
            UIView.animate(withDuration: 0.2,
                           delay: 0,
                           options: .curveEaseOut,
                           animations: {
                            cell.updateTrashSize(50)
            }, completion: nil)
        }
    }
    func panEnded(_ sender: UIPanGestureRecognizer) {
        let cell = sender.view as! TestCell
        let dx = sender.translation(in: self.view).x
        if abs(dx) > cell.frame.width / 4 {
            UIView.animate(withDuration: 0.2,
                           delay: 0,
                           options: .curveEaseOut,
                           animations: {
                            cell.overlay.layer.position.x = -cell.overlay.frame.width
            }, completion: nil)
            let indexPath = self.tableView.indexPath(for: cell)!
            self.items.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .none)
        } else {
            UIView.animate(withDuration: 0.2,
                           delay: 0,
                           options: .curveEaseOut,
                           animations: {
                            cell.overlay.layer.position.x = cell.layer.position.x
                            cell.updateTrashSize(10)
            }, completion: nil)
        }
    }
}
