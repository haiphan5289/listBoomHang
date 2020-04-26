//
//  HomeScreenCell.swift
//  ListBoomHang
//
//  Created by MacbookPro on 4/24/20.
//  Copyright © 2020 MacbookPro. All rights reserved.
//

import UIKit

class HomeScreenCell: UITableViewCell {

    @IBOutlet weak var vContent: UIView!
    @IBOutlet weak var lbUserName: UILabel!
    @IBOutlet weak var lbNumberPhone: UILabel!
    @IBOutlet weak var avtarImg: UIImageView!
    @IBOutlet weak var lbDes: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.applyShadowAndRadius(sizeX: 0, sizeY: 3, shadowRadius: 6, shadowColor: CustomColor.black16two.color)
        vContent.radiusShadow(radius: 10)
//        self.backgroundColor = .red
        avtarImg.clipToBoundAndRadius(radius: 23)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateUI(model: UserInfo) {
        self.lbUserName.text = model.userName
        self.lbNumberPhone.text = model.numberPhone
        self.lbDes.text = "\(model.strFB ?? "")\n\(model.description ?? "")"
        DispatchQueue.main.async {
            let img = UIImage().decodeBase64(toImage: model.avatarImage)
            self.avtarImg.image = img
        }
    }
}
