//
//  ProfilePost.swift
//  Navigation
//
//  Created by Сманчос on 16.02.2023.
//

import UIKit

struct ProfilePost {
    var author: String
    var image: UIImage
    var description: String?
    var likes: Int
    var views: Int

    static func createMockPofilePost() -> [ProfilePost] {
        return [
            ProfilePost(author: "Unrecognized Genius - Unrecognized Genius", image: UIImage(named: "genius")!,description: "At the 2012 Global Roundtable conducted in Split, Croatia in July, co-sponsored by the World Academy of Art and Science, the organizers proposed introduction of a new TESLA award for unrecognized genius, an acronym for The Earth Supreme Level Award. \nПРОДОЛЖЕНИЕ В СЛЕДУЮЩЕМ ПОСТЕ!", likes: 1, views: 2),
            ProfilePost(author: "Unrecognized", image: UIImage(named: "profileImage")!, description: "This is an important and commendable initiative by philanthropist Hares Youssef which directly ties into the Academy’s exploration of mental creativity and the limits to rationality. While the emphasis of the TESLA Awards will be on contributions to science and technology, genius has an important role to play in all fields of human activity – including original contributions to thought, social innovation, business, the humanities, arts, culture and spirituality. \nПРОДОЛЖЕНИЕ В СЛЕДУЮЩЕМ ПОСТЕ!", likes: 1432, views: 1231323),
            ProfilePost(author: "Genius", image: UIImage(named: "profileImage")!, description: "Awards are needed to encourage contributions in all these fields.\nВСЕ!", likes: 31230, views: 1231323),
            ProfilePost(author: "Lowka", image: UIImage(named: "profileImage")!, likes: 1231323, views: 1231323)
        ]
    }
}
