//
//  HistoryViewController.swift
//  DynamicCalculator
//
//  Created by Vikram Kunwar on 13/09/23.
//

import UIKit

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var historyTableView: UITableView!
    

    
    var historyData: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyTableView.reloadData()
               
               self.title = "History"
               
               if let navigationBar = self.navigationController?.navigationBar {
                   let titleTextAttributes: [NSAttributedString.Key: Any] = [
                       .foregroundColor: UIColor.white
                   ]
                   navigationBar.titleTextAttributes = titleTextAttributes
               }
        
        // Create a "Clear All" button and set it as the right bar button item
                let clearAllButton = UIBarButtonItem(title: "Clear All", style: .plain, target: self, action: #selector(clearAll))
                clearAllButton.tintColor = .white
                navigationItem.rightBarButtonItem = clearAllButton
        

        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        historyTableView.reloadData()
    }
    
    @objc func clearAll() {
        // Clear the entire historyData array
        historyData.removeAll()
        
        // Reload the table view to reflect the changes
        historyTableView.reloadData()
    }
    
    
    
    
}

extension HistoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = historyTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryTVC
        cell.historyLabel.text = historyData[indexPath.row]
        // Enable swipe-to-delete
        cell.showsReorderControl = false
        cell.shouldIndentWhileEditing = true
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Remove the deleted item from your data source (historyData)
            historyData.remove(at: indexPath.row)
            
            // Update the table view to reflect the changes
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
