//
//  GitHubImage.swift
//  search2
//
//  Created by Diviana on 3.01.23.
//

import SwiftUI

struct GitHubImage: View {
    var body: some View {
        HStack {
            Image("images")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            
                .padding(.horizontal)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.black, lineWidth: 4)
                }
            .shadow(radius: 27)
        }
        
    }
}

struct GitHubImage_Previews: PreviewProvider {
    static var previews: some View {
        GitHubImage()
    }
}
