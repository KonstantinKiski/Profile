//
//  User.swift
//  Profile
//
//  Created by Константин Киски on 13.05.2020.
//  Copyright © 2020 Константин Киски. All rights reserved.
//

struct Profession {
    var name = "Personal Trainer"
    var industry = "Beauty"
    var skills = "Ninja Warrior, Bodyweight Fitness, Dietary Advice, CrossFit, Boxing"
    var details = "I teach classes in HealthCity on Mondays and Wednesdays. I give private traning sessions in the Rembrandt Park."
}

struct Communication {
    var phone = "+31(__)___-__-__"
    var email = "profile@gmail.com"
    var instagram = "@brandonmc"
    var facebook = "facebook.com/brandon.mc"
    var website = "brandonfitness.nl"
}

struct Location {
    var company = "HealthCity Amsterdam"
    var address = "Prins Hendrikkade 47, 10124412414213"
    var locationOfServices = "Amsterdam, NL"
}

struct User {
    
    var name = "Brandon"
    var surname = "McCourtney"
    var userName = "brandon_mc"
    var email = "brandon_mc@gmail.com"
    var profession = Profession()
    var communication = Communication()
    var location = Location()
    var fullname: String {
        return "\(name) \(surname)"
    }
}
