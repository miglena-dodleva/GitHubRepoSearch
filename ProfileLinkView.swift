//
//  SourseLinkView.swift
//  search2
//
//  Created by Diviana on 11.01.23.
//

import SwiftUI

struct ProfileLinkView: View {
    
    
    var url: String
    
    var body: some View {
        GroupBox() {
            HStack{
                Text("Check the Profile").font(.headline)
                Spacer()
                Link("",destination: URL(string: url)!)
//                Image(systemName: "shareplay")
//                    .symbolRenderingMode(.palette)
//                    .foregroundStyle(.blue, .black)
//                    .font(.system(size: 44))
                Image(systemName: "person.crop.circle.fill.badge.plus")
                    .renderingMode(.original)
                    .foregroundColor(.blue)
                    .font(.largeTitle)
                
            }
            .font(.footnote)
        }.onTapGesture {
            UIApplication.shared.open(URL(string: url)!)
        }
    }
}

struct ProfileLinkView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileLinkView(url:"https://avatars.githubusercontent.com/u/10639145?v=4")
    }
}
