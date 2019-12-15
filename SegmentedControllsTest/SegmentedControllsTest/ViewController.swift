//
//  ViewController.swift
//  SegmentedControllsTest
//
//  Created by Riku_Yamamoto on 2019/12/14.
//  Copyright © 2019 Riku_Yamamoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let itemsSource = ["items1", "items2", "items3", "items4", "items5", "items6", "items7", "items8"]
    var items: [String] = []


    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        items = itemsSource
        
        segmentedControl.addTarget(self, action: #selector(segmentedCtlValueChanged(_:)), for: .valueChanged)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    @objc func buttonTapped(_ sender: UIButton) {
        print("Tapped!")
    }
    @objc func segmentedCtlValueChanged(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        if index == 0 {
            items = itemsSource
        } else {
            items = itemsSource.reversed()
        }
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell")!
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    
}
