//
//  ViewController.swift
//  iOS_Swift_LayoutExample
//
//  Created by admin on 2019/1/18.
//  Copyright © 2019 zhouqiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let items = ["LinearLayoutView", "RelativeLayoutView", "FlowLayoutView"]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "LayoutView"


        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "layout")
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "layout", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(LinearLayoutViewController(), animated: true)
        case 1:
            navigationController?.pushViewController(RelativeLayoutViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(FlowLayoutViewController(), animated: true)
        default:
            break
        }
    }
}

