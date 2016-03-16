//
//  MyTableViewCell.swift
//  ProjetoTableView
//
//  Created by Usuário Convidado on 25/02/16.
//  Copyright © 2016 Usuário Convidado. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var myTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        let mainText: UILabel = UILabel(frame: CGRect(x: 5, y: 5, width: 190, height: 90))
//        mainText.text = "Ola"
//        self.contentView.addSubview(mainText)
        
        
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
