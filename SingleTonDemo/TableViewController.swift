//
//  TableViewController.swift
//  SingleTonDemo
//
//  Created by trung on 2018/08/20.
//  Copyright © 2018 trung. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet var noDataView: UIView!
    
    @IBOutlet weak var footerView: UIView!
    
    var hasNoData = true {
        didSet {
            hasNoData ? (tableView.tableFooterView = noDataView) : (tableView.tableFooterView = footerView)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        hasNoData = Singleton.allTeam.array.count == 0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        hasNoData = Singleton.allTeam.array.count == 0
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Singleton.allTeam.array.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = Singleton.allTeam.array[indexPath.row]
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Singleton.allTeam.array.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            hasNoData = Singleton.allTeam.array.count == 0
        }
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let toDetailViewController = segue.destination as? DetailViewController {
            if let index = tableView.indexPathForSelectedRow {
                toDetailViewController.dataTake = Singleton.allTeam.array[index.row]
            }
        }
    }

    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        if let fromDetailViewController = unwindSegue.source as? DetailViewController {
            if let index = tableView.indexPathForSelectedRow {
                Singleton.allTeam.array[index.row] = fromDetailViewController.dataTake ?? ""
            }
            else {
                Singleton.allTeam.array.append(fromDetailViewController.dataTake ?? "")
            }
            tableView.reloadData()
        }
    }

}
