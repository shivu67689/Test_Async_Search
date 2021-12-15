//
//  ViewController.swift
//  test_test
//
//  Created by Shivakumarswami Hiremath on 08/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtfield_friend:UITextField!
    @IBOutlet weak var txtfield_cricketer:UITextField!
  
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submit(_ sender:UIButton){
        
        let friend = txtfield_friend.text ?? ""
        let cricket = txtfield_cricketer.text ?? ""
        
         let friendsArray = friend.split(separator: ",")
           let cricketArray = cricket.split(separator: ",")
        
       
        var final_list:[String.SubSequence] = []
        for obj in friendsArray{
            final_list.append(obj)
        }
        
        for obj in cricketArray{
            final_list.append(obj)
        }
        
       
        
                    let dest = self.storyboard?.instantiateViewController(withIdentifier: "Detail_Controller") as! Detail_Controller
                    dest.datasource = final_list
                   
        
                    self.navigationController?.pushViewController(dest, animated: true)
        
        
       
    }

}



