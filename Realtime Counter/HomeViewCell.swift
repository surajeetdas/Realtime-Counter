//
//  HomeViewCell.swift
//  Realtime Counter
//
//  Created by Vantage Circle on 03/10/22.
//

import UIKit

class HomeViewCell: UITableViewCell {

    @IBOutlet weak var nameLabelText : UILabel!
    @IBOutlet weak var pointsLabelText : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(_ userViewModel : UserViewModel, _ indexRow : Int){
        self.nameLabelText.text = userViewModel.getUserName(index: indexRow)
        self.pointsLabelText.text = String(userViewModel.getUserPoints(index: indexRow))
    }
    
}
