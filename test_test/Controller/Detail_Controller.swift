//
//  Detail_Controller.swift
//  test_test
//
//  Created by Shivakumarswami Hiremath on 13/12/21.
//

import UIKit
import Kingfisher

class Detail_Controller: UIViewController {

    
    var local_result:Result?
    
    
    @IBOutlet weak var ScrollView:UIScrollView!
    @IBOutlet weak var lbl_info:UILabel!
    
    @IBOutlet weak var Imageview:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        guard let result = self.local_result else {return}
        lbl_info.text = "Headline : \(result.headline) \n Display title : \(result.displayTitle) \n Summary short :\(result.summaryShort) "
        guard let url = URL(string: result.multimedia?.src ?? "") else {
            Imageview.image = UIImage(named: "no_content")
            
            
            return
        }
        Imageview.kf.setImage(with:url)
        
    

        // Do any additional setup after loading the view.
    }
    
   

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var contentRect = CGRect.zero
        
        
        for view: UIView in ScrollView.subviews {
        contentRect = contentRect.union(view.frame)
        }
        
        
        ScrollView.contentSize = contentRect.size

    }

}



