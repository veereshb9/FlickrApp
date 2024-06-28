//
//  FlickrImageModel.swift
//  FlickrApp
//
//  Created by Veeresh on 6/28/24.
//

import Foundation

struct FlickrResponseModel: Decodable {
    var items: [FlickrImageModel]
}

struct FlickrImageModel: Decodable, Identifiable {
    var id = UUID()
    var title: String
    var media: FlickrImage
    var published: String
    var description: String
    var author: String
    
    enum CodingKeys: CodingKey {
        case id
        case title
        case media
        case published
        case description
        case author
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.media = try container.decode(FlickrImage.self, forKey: .media)
        self.published = try container.decode(String.self, forKey: .published)
        self.description = try container.decode(String.self, forKey: .description)
        self.author = try container.decode(String.self, forKey: .author)
    }
    
    init(id: UUID = UUID(), title: String, media: FlickrImage, published: String, description: String, author: String) {
        self.id = id
        self.title = title
        self.media = media
        self.published = published
        self.description = description
        self.author = author
    }
}

extension FlickrImageModel {
    var image: String {
        return media.m
    }
    
    var formatedDate: String {
        DateUtil.convertDateString(dateString: published)
    }
}

struct FlickrImage: Decodable {
    let m: String
}
