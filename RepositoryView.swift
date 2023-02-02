//
//  RepositoryView.swift
//  search2
//
//  Created by Jessica on 31.01.23.
//

import SwiftUI

struct RepositoryView: View {
    
    private let repo: GithubRepo
    init(repository: GithubRepo) {
        self.repo = repository
    }
    
    var body: some View {
        NavigationLink(destination: GitHubDetails(item: repo)) {
            
            HStack{
                
                AsyncImage(url: URL(string: repo.owner.avatar)!, content: {downloadedImage in downloadedImage.resizable()}, placeholder: {Color(uiColor: UIColor.lightGray)}
               ).scaledToFit()
                .frame(height: 70)
                .cornerRadius(4)
                //.resizable()
                //.frame(width: 80, height: 80)
                
                //Image(service.Avatar)
                    
                
                VStack(alignment: .leading, spacing: 5){
                    Text(repo.name)
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                    
                    Text(repo.description ?? "null")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                }
            }
            .onTapGesture {
                UIApplication.shared.open(URL(string: repo.url)!)
                    
                
            }
            .padding(8)
        }
        
    }
}

struct RepositoryView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryView(repository: GithubRepo(id: 44838949, name: "Name", description: "My first api", owner: Avatar(avatar:"https://avatars.githubusercontent.com/u/10639145?v=4", ownername: "Viktor", url: "kjh"), fullname: "Swift-API", language: "c++", reviewscount: 77, dateofcreation: "22.2.2222", url: "kkkkk"))
    }
}
