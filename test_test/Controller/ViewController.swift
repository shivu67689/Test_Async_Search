//
//  ViewController.swift
//  test_test
//
//  Created by Shivakumarswami Hiremath on 13/12/21.
//

import UIKit


protocol SearchControllerDelegate: NSObject {
    
    var searchQueue:OperationQueue {get set}
    
    var searchResult:[Result] {get set}
    
    func searchDisplayController(controller:ViewController, searchText:String)
    
    func cancelSearch()
}

class ViewController: UIViewController {
    
    var searchQueue: OperationQueue = OperationQueue()
    @IBOutlet weak var tableView:UITableView!{
        didSet{
            tableView.tableFooterView = UIView()
        }
    }
  
    var searchResult:[Result] = []
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //initViewModel()
        tableView.estimatedRowHeight = 100
        
        tableView.rowHeight = UITableView.automaticDimension
        
    }
    


    

}


// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        let cellVM = searchResult[indexPath.row]
        cell.cellViewModel = cellVM
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let dest = self.storyboard?.instantiateViewController(withIdentifier: "Detail_Controller") as! Detail_Controller
        dest.local_result = self.searchResult[indexPath.row]
        self.navigationController?.pushViewController(dest, animated: true)
    }
    
    
}

extension ViewController:SearchControllerDelegate, UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.cancelSearch()
        self.tableView.reloadData()
        self.searchDisplayController(controller: self, searchText: searchBar.text!)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.cancelSearch()
        self.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchDisplayController(controller: self, searchText: searchBar.text ?? "")
    }
    
    
    private func showErrorAlert(errormessage:String?) {
        let alertController = UIAlertController(title: " Error", message: errormessage ?? "Something went wrong", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func searchDisplayController(controller:ViewController, searchText:String) {
        guard !searchText.isEmpty else {
            self.searchResult.removeAll()
            return
        }
        
        self.searchQueue.cancelAllOperations()
        self.searchQueue.addOperation  { [weak self] in
           
            NetWorking_Sarvice().GetMovies(queryString: searchText) {  response, errorMessage in
                
                
                
                if errorMessage == nil {
                    
                    DispatchQueue.main.async {
                        
                        guard let results_local = response?.results else {return}
                            
                        
                        self?.searchResult = results_local
                        self?.tableView.isHidden = false
                        
                    }
                  
                } else {
                    self?.searchResult = []
                    DispatchQueue.main.async {
                        self?.tableView.isHidden = true
                       // self?.showErrorAlert(errormessage: errorMessage)
                    }
                }
                DispatchQueue.main.async {
                    self?.title = searchText
                    self?.tableView.reloadData()
                }
            }
            
        }
    }
    
    func cancelSearch() {
        self.searchQueue.cancelAllOperations()
        self.searchResult.removeAll()
        self.title = ""
    }
}

