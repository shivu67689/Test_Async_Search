//
//  TableViewCell.swift
//  test_test
//
//  Created by Shivakumarswami Hiremath on 13/12/21.
//


import UIKit
import Kingfisher

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var image_view:UIImageView!
    
    @IBOutlet weak var lbl_title:UILabel!
    
    @IBOutlet weak var lbl_author:UILabel!
    
    @IBOutlet weak var lbl_desc:UILabel!
    
    
    var cellViewModel: Result? {
        didSet {
            
          
            lbl_title.text = cellViewModel?.headline
            //display_title
            lbl_author.text = cellViewModel?.displayTitle
            lbl_desc.text = cellViewModel?.summaryShort
            
            guard let url = URL(string: cellViewModel?.multimedia?.src ?? "") else {
                
                image_view.image = UIImage(named: "no_content")
                return}
            image_view.kf.setImage(with: url, placeholder: UIImage(named: "no_content"))
            //setImage(with:url )
        }
    }
    


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
