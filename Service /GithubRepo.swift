//
//  GithubRepo.swift
//  search2
//
//  Created by Jessica on 3.02.23.
//

import Foundation
import CoreData

public class GithubRepo: NSManagedObject {
    
    @NSManaged public var id: NSNumber
    @NSManaged public var name: String
    @NSManaged public var descr: String?
    @NSManaged public var fullname: String
    @NSManaged public var dateofcreating: String
    @NSManaged public var language: String?
    @NSManaged public var reviewscount: NSNumber
    @NSManaged public var url: String
    @NSManaged public var avatarimage: String
    @NSManaged public var avatarurl: String
    @NSManaged public var avatarname: String
    
}

extension GithubRepo: Identifiable {
    func map(from dto:GithubRepoDto){
        self.id = NSNumber(value: dto.id)
        self.name = dto.name
        self.descr = dto.description
        self.fullname = dto.fullname
        self.dateofcreating = dto.dateofcreation
        self.language = dto.language
        self.reviewscount = NSNumber(value: dto.reviewscount)
        self.url = dto.url
        self.avatarname = dto.owner.ownername
        self.avatarimage = dto.owner.avatar
        self.avatarurl = dto.owner.url
        
    }
}
