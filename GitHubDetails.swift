//
//  GitHubDetails.swift
//  search2
//
//  Created by Diviana on 9.01.23.
//

import SwiftUI
import Foundation


struct GitHubDetails: View {
    
    
    var item: GithubRepo
    
    
    @State private var isRotated = false
    var animation: Animation {
        Animation.easeOut
    }
    
//    @State private var textColor: Color = .clear
//
//    private func setAverageColor() {
//        let uiColor = UIImage(named: item.owner.avatar)?.averageColor ?? .clear
//            textColor = Color(uiColor)
//        }
    
    var body: some View {
        
            ScrollView(.vertical, showsIndicators: false){
                
                VStack(alignment: .center, spacing: 20){
                    
                    //Image
                    AsyncImage(url: URL(string: item.owner.avatar), content: {downloadedImage in downloadedImage.resizable()}, placeholder: {Color(uiColor: UIColor.lightGray)}
                   ).scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(4)
                    .shadow(radius: 10)
                    .rotationEffect(Angle.degrees(isRotated ? 360 : 0))
                    .animation(animation)
                    .onAppear() {
                        self.isRotated = true }
                    
//                    
//                    
//                    Button("Rotate") {
//                                self.isRotated.toggle()
//                            }
                    
                    VStack(alignment: .center, spacing: 20){
                        
                        
                        //Full name
                        Text(item.fullname)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.blue)
                        
                        //Owner name
                        Text(item.owner.ownername)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                        
                        //Description
                        Text(item.description ?? "null")
                            .multilineTextAlignment(.leading)
                        
                        //Characteristics
                        GroupBox("Characteristics:") {
                            Text("Date of creation: \(item.dateofcreation)")
                            Text("Language: \(item.language ?? "null")")
                            Text("Review count: \(item.reviewscount)")
                        }
                        
                        Text("VISIT THE OWNER'S GITHUB PROFILE ")
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                        
                        //Link - owner github
                        ProfileLinkView(url: item.owner.url)
                        
                        Text("VISIT THE GITHUB PAGE ")
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                        
                        //Link - github
                        RepoLinkView(url: item.url)
                        
                    }
                    
                    
                    
                }//:VSTAK
                .padding(.horizontal, 20)
                .frame(maxWidth: 640, alignment: .center)
                
                
                
            }//:SCROLL
            //.edgesIgnoringSafeArea(.top)
            
    }
}

struct GitHubDetails_Previews: PreviewProvider {
    static var previews: some View {
        GitHubDetails( item: GithubRepo(id: 44838949, name: "Name", description: "My first api", owner: Avatar(avatar:"https://avatars.githubusercontent.com/u/10639145?v=4", ownername: "Viktor", url: "kjh"), fullname: "Swift-API", language: "c++", reviewscount: 77, dateofcreation: "22.2.2222", url: "kkkkk"))
    }
}
