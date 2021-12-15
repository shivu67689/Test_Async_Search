//
//  Detail_Controller.swift
//  test_test
//
//  Created by Shivakumarswami Hiremath on 08/12/21.
//

import UIKit

class Detail_Controller: UIViewController {

    
    var datasource:[String.SubSequence] = []
    
    
    
    @IBOutlet weak var tableview:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    

        // Do any additional setup after loading the view.
    }
    

    

}


extension Detail_Controller:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = String(datasource[indexPath.row])
        
        return cell
    }
}
