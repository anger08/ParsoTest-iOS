//
//  Profile.swift
//  ParsoTest-iOS
//
//  Created by Angelber Castro on 7/7/22.
//

import Foundation

struct Results: Codable {
    let gender      : String?
    let name        : Name?
    let location    : Location
    let email       : String?
    let login       : Login
    let dob         : Dod
    let registered  : Registered
    let phone       : String?
    let cell        : String?
    let id          : ID
    let picture     : Picture
    let nat         : String?
}

struct Info : Codable {
    let seed    : String?
    let results : Int?
    let page    : Int?
    let version : String?
}

struct Name: Codable {
    let title : String?
    let first : String?
    let last  : String?
}

struct Location: Codable {
    let street      : Street
    let city        : String?
    let state       : String?
    let country     : String?
    let coordinates : Coordinates
    let timezone    : Timezone
}

struct Street: Codable {
    let number      : Int?
    let name        : String?
}

struct Coordinates: Codable {
    let latitude    : String?
    let longitude   : String?
}

struct Timezone: Codable {
    let offset      : String?
    let description : String?
}

struct Login: Codable {
    let uuid     : String?
    let username : String?
    let password : String?
    let salt     : String?
    let md5      : String?
    let sha1     : String?
    let sha256   : String?
}

struct Dod: Codable {
    let date: String?
    let age : Int?
}

struct Registered: Codable {
    let date      : String?
    let age       : Int?
}

struct ID: Codable {
    let name : String?
    let value: String?
}

struct Picture: Codable {
    let large     : String?
    let medium    : String?
    let thumbnail : String?
}
