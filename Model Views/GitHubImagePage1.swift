//
//  GitHubImage.swift
//  search2
//
//  Created by Diviana on 3.01.23.
//

import SwiftUI

struct GitHubImage: View {
    
    
    @State private var isRotated = false
    var animation: Animation {
        Animation.easeOut
    }

//    var animation: Animation {
//        Animation.linear
//        .repeatForever(autoreverses: false)
//    }
//
    
    
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
                .rotationEffect(Angle.degrees(isRotated ? 360 : 0))
                .animation(animation)
                .onAppear() {
                    self.isRotated = true }
                
            .shadow(radius: 27)
        }
        
    }
}

struct GitHubImage_Previews: PreviewProvider {
    static var previews: some View {
        GitHubImage()
    }
}
