//
//  ShutterstockImage.swift
//  VIPER
//
//  Created by Evghenii Nicolaev on 08/02/2018.
//  Copyright © 2018 Tigerspike. All rights reserved.
//

import Foundation

struct ShutterstockImage: Decodable {
    var id: String
    var description: String?
    var url: String?

    enum ImageKeys: String, CodingKey {
        case id
        case description
        case assets
    }

    enum AssetsKeys: String, CodingKey {
        case preview = "large_thumb"
    }

    enum PreviewKeys: String, CodingKey {
        case url
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: ImageKeys.self)
        self.id = try values.decode(String.self, forKey: .id)
        self.description = try  values.decode(String.self, forKey: .description)
        self.id = try values.nestedContainer(keyedBy: AssetsKeys.self, forKey: .assets)
            .nestedContainer(keyedBy: PreviewKeys.self, forKey: .preview)
            .decode(String.self, forKey: .url)
    }
}
