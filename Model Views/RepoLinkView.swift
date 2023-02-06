//
//  RepoLinkView.swift
//  search2
//
//  Created by Diviana on 11.01.23.
//

import SwiftUI

struct RepoLinkView: View {
    
    var url: String
    
    var body: some View {
        
        GroupBox() {
            HStack{
                Text("Check the Project").font(.headline)
                Spacer()
                Link("",destination: URL(string: url)!)
                
                Image(systemName: "arrow.up.right.square")
                    .renderingMode(.original)
                    .foregroundColor(.blue)
                    .font(.largeTitle)
                
            }
            .font(.footnote)
            
        }.onTapGesture {
            UIApplication.shared.open(URL(string: url)!)
        }
        
    }
    
    struct RepoLinkView_Previews: PreviewProvider {
        static var previews: some View {
            RepoLinkView(url:"https://avatars.githubusercontent.com/u/10639145?v=4");
        }
    }
}
