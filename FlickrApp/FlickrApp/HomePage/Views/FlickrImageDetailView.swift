//
//  FlickrImageDetailView.swift
//  FlickrApp
//
//  Created by Veeresh on 6/28/24.
//

import SwiftUI
import Kingfisher

struct FlickrImageDetailView: View {
    let model: FlickrImageModel
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(model.title)
                imageView
                descriptionView(title: "Author", description: model.author)
                descriptionView(title: "Date", description: model.formatedDate)
                description
                    .padding(.top, 8)
                Spacer()
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.all, 8)
    }
    
    @ViewBuilder var imageView: some View {
        if let imageUrl = URL(string: model.image) {
            KFImage(imageUrl)
                .placeholder({ _ in
                    Image(.imageplaceholder)
                })
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(minWidth: 150, maxWidth: .infinity, minHeight: 150, maxHeight: 250)
        }
    }

    @ViewBuilder func descriptionView(title: String, description: String) -> some View {
        HStack {
            Text(title + ":")
            Text(description)
        }
    }
    
    @ViewBuilder var description: some View {
        VStack(alignment: .leading) {
            Text("Description")
                .bold()
            Text(model.description)
        }
    }
}

#Preview {
    let description = """
 <p><a href='https://www.flickr.com/people/oldigitaleye/\">oldigitaleye</a> posted a photo:</p> <p><a href=\"https://www.flickr.com/photos/oldigitaleye/53819122105/\" title=\"EDEWECHT - TRACTOR PULL - 2012 201\"><img src=\"https://live.staticflickr.com/65535/53819122105_34a44420d6_m.jpg\" width=\"240\" height=\"160\" alt=\"EDEWECHT - TRACTOR PULL - 2012 201\" /></a></p>
"""
    return FlickrImageDetailView(model: FlickrImageModel(title: "EDEWECHT - TRACTOR PULL - 2012 201",
                                            media: FlickrImage(m: "https://live.staticflickr.com/65535/53819122105_34a44420d6_m.jpg"),
                                            published: "2024-06-27T06:01:34Z",
                                            description: description,
                                            author: "nobody@flickr.com (\"oldigitaleye\")"))
}
