//
//  TableViewController.swift
//  TableView_MixStatic_Dynamic_Cells
//
//  Created by Jian Ting Li on 4/14/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var services = ["Haircut", "Hair Wash", "Styling", "Coloring", "Nails"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ServiceCell", bundle: nil), forCellReuseIdentifier: "ServiceCell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return services.count
        }
        return super.tableView(tableView, numberOfRowsInSection: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCell") as? ServiceCell else {
                fatalError("ServiceCell is nil")
            }
            cell.ServiceImageView.image = UIImage.init(named: "cat")
            cell.serviceName.text = services[indexPath.row]
            return cell
        }
        return super.tableView(tableView, cellForRowAt: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        if indexPath.section == 1 {
            let newIndexPath = IndexPath(row: 0, section: indexPath.section)
            return super.tableView(tableView, indentationLevelForRowAt: newIndexPath)
        }
        return super.tableView(tableView, indentationLevelForRowAt: indexPath)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 200
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
}
