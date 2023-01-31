//
//  GitHubDetails.swift
//  search2
//
//  Created by Diviana on 9.01.23.
//

import SwiftUI



struct GitHubDetails: View {
    
    
    var item: GithubRepo
    
    var body: some View {
        
            ScrollView(.vertical, showsIndicators: false){
                
                VStack(alignment: .center, spacing: 20){
                    
                    //Image
                    AsyncImage(url: URL(string: item.owner.avatar), content: {downloadedImage in downloadedImage.resizable()}, placeholder: {Color(uiColor: UIColor.lightGray)}
                   ).scaledToFit()
                    .frame(height: 220)
                    .cornerRadius(4)
                    .shadow(radius: 10)
                    
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
                            Text(String(item.reviewscount))
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
                    
                    
                    
//                    //TITILE
//                    Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
//                        .font(.largeTitle)
//                        .fontWeight(.heavy)
//                        .foregroundColor(.blue)
//
//                    VStack(alignment: .center){
//                        HStack{
//                            Image("images")
//                                .resizable(capInsets: EdgeInsets(top: 1.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
//                                .aspectRatio(contentMode: .fit)
//
//
//                            GroupBox( "Characteristics:") {
//                                VStack(alignment: .leading){
//                                    Text("Created at:")
//                                        .multilineTextAlignment(.leading)
//                                    Text("Language:").multilineTextAlignment(.leading)
//                                    Text("Reviews:")
//
//                                }
//                            }
//                        }
//                    }
//                    VStack(alignment: .center, spacing: 20){
//                            Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
//
//
//                    }
                    
//
//
//
//                    HEADER
//
//                    VStack(alignment: .leading, spacing: 20){
////
//                        //TITILE
//                        Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
//                            .font(.largeTitle)
//                            .fontWeight(.heavy)
//                            .foregroundColor(.blue)
//////
////                        //HEADLINE
////                        Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/).font(.headline).multilineTextAlignment(.center)
////
////                        //DESCRIPTION
////                        Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/).multilineTextAlignment(.leading)
//
//                        //SUBHEADLINE
//                        Text("Characteristics:").fontWeight(.bold).foregroundColor(.blue)
//
//                        Image(systemName: "heart")



                        //LINK
                     //:VSTAK
                    
//                }
//                .padding()//:VSTAK
//
//
//
//            }
//        }
//
//    }
//}
//
//struct GitHubDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        GitHubDetails()
//    }
//}
