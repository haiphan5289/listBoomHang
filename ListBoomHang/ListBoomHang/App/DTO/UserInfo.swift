//
//  UserInfo.swift
//  ListBoomHang
//
//  Created by MacbookPro on 4/26/20.
//  Copyright © 2020 MacbookPro. All rights reserved.
//

import UIKit

struct UserInfo: Codable {
    let userName: String?
    let numberPhone: String?
    let strFB: String?
    let description: String?
    let avatarImage: String?
    
    enum CodingKeys: String, CodingKey {
        case userName, numberPhone, strFB, description, avatarImage
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userName = try values.decodeIfPresent(String.self, forKey: .userName)
        numberPhone = try values.decodeIfPresent(String.self, forKey: .numberPhone)
        strFB = try values.decodeIfPresent(String.self, forKey: .strFB)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        avatarImage = try values.decodeIfPresent(String.self, forKey: .avatarImage)
    }
}
