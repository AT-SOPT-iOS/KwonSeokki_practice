//
//  TestModel.swift
//  Week3
//
//  Created by 권석기 on 4/26/25.
//

import UIKit

struct ChatModel {
    let profileImg: UIImage
    let name: String
    let place: String
    let message: String
    let itemImg: UIImage
}

extension ChatModel {
    static func dummy() -> [ChatModel] {
        return [
            ChatModel(profileImg: .minji, name: "김가현", place: "광진구", message: "내말에답장해줘", itemImg: .product1),
            ChatModel(profileImg: .karina, name: "김현수", place: "여의도", message: "마크내사랑", itemImg: .product2),
            ChatModel(profileImg: .suji, name: "서주영", place: "잠실", message: "마크내꺼", itemImg: .product3)
        ]
    }
}

struct ItemModel {
    let itemImg: UIImage
    let name: String
    let price: String
    var heartIsSelected: Bool
}

extension ItemModel {
    static func dummy() -> [ItemModel] {
        return [
            ItemModel(itemImg: .colProduct1, name: "퉁퉁퉁사후르", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .colProduct2, name: "오쏘몰", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .colProduct3, name: "애플워치", price: "5000", heartIsSelected: true)
        ]
    }
}
