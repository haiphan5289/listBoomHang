//
//  AddCustom.swift
//  ListBoomHang
//
//  Created by MacbookPro on 4/24/20.
//  Copyright © 2020 MacbookPro. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import SVProgressHUD
import Firebase

enum AddCustomImage: Int, CaseIterable {
    case user
    case numberPhone
    case facebook
    
    var img: UIImage? {
        switch self {
        case .user:
            return UIImage(named: "ic_user_black")
        case .numberPhone:
            return UIImage(named: "ic_phone_black")
        case .facebook:
            return UIImage(named: "ic_fb")
        }
    }
}

class AddCustom: UIViewController {

    @IBOutlet var vContent: [UIView]!    
    @IBOutlet weak var tvContent: UITextView!
    private let disposebag = DisposeBag()
    var ref: FIRDatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference()
        self.ref.child("users").setValue(["username": "username"])
        visualize()
        setupRX()
    }
    private func setupRX() {
        self.tvContent.rx.didBeginEditing.subscribe(onNext: { _ in
            if (self.tvContent.textColor == CustomColor.greyishbrown.color) {
                self.tvContent.text = ""
            }
            self.tvContent.textColor = CustomColor.blackthree.color
        }).disposed(by: disposebag)
        
        self.tvContent.rx.text.subscribe(onNext: { (value) in
            
            
        }).disposed(by: disposebag)
    }
    
    private func visualize() {
        vContent.filter {
            $0.backgroundColor = CustomColor.whitefive.color
            $0.clipToBoundAndRadius(radius: 5)
            return true
        }
        tvContent.textColor = CustomColor.greyishbrown.color
        tvContent.text = "Nhập lí do boom hàng...."
    }

}
