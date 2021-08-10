//
//  ViewController.swift
//  PullToRefreshPractice
//
//  Created by 장기화 on 2021/08/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshSomthing()
    }
    
    func refreshSomthing() {
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.tintColor = .systemRed
        tableView.refreshControl?.attributedTitle = NSAttributedString(string: "반갑습니당")
        tableView.refreshControl?.addTarget(self, action: #selector(update), for: .valueChanged)
    }
    
    @objc func update() {
        tableView.refreshControl?.endRefreshing()
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = String(indexPath.row)
        let number = Date().timeIntervalSince1970
        cell.textLabel?.text = String(number)
        return cell
    }
}
