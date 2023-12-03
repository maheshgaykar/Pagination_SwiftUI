//
//  UserModel.swift
//  Pagination_SwiftUI
//
//  Created by mahesh gaykar on 03/12/23.
//

import Foundation

// MARK: - Users
struct Users: Codable {
    let success: Bool?
    let message: String?
    let totalUsers, offset, limit: Int?
    let users: [User]?
    
    enum CodingKeys: String, CodingKey {
        case success, message
        case totalUsers = "total_users"
        case offset, limit, users
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Users.CodingKeys> = try decoder.container(keyedBy: Users.CodingKeys.self)
        
        self.success = try container.decodeIfPresent(Bool.self, forKey: Users.CodingKeys.success)
        self.message = try container.decodeIfPresent(String.self, forKey: Users.CodingKeys.message)
        self.totalUsers = try container.decodeIfPresent(Int.self, forKey: Users.CodingKeys.totalUsers)
        self.offset = try container.decodeIfPresent(Int.self, forKey: Users.CodingKeys.offset)
        self.limit = try container.decodeIfPresent(Int.self, forKey: Users.CodingKeys.limit)
        self.users = try container.decodeIfPresent([User].self, forKey: Users.CodingKeys.users)
    }
    
    func encode(to encoder: Encoder) throws {
        var container: KeyedEncodingContainer<Users.CodingKeys> = encoder.container(keyedBy: Users.CodingKeys.self)
        
        try container.encodeIfPresent(self.success, forKey: Users.CodingKeys.success)
        try container.encodeIfPresent(self.message, forKey: Users.CodingKeys.message)
        try container.encodeIfPresent(self.totalUsers, forKey: Users.CodingKeys.totalUsers)
        try container.encodeIfPresent(self.offset, forKey: Users.CodingKeys.offset)
        try container.encodeIfPresent(self.limit, forKey: Users.CodingKeys.limit)
        try container.encodeIfPresent(self.users, forKey: Users.CodingKeys.users)
    }
}

// MARK: - User
struct User: Codable {
    let id: Int?
    let gender: Gender?
    let dateOfBirth, job, city, zipcode: String?
    let latitude: Double?
    let profilePicture: String?
    let email, lastName, firstName, phone: String?
    let street, state, country: String?
    let longitude: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, gender
        case dateOfBirth = "date_of_birth"
        case job, city, zipcode, latitude
        case profilePicture = "profile_picture"
        case email
        case lastName = "last_name"
        case firstName = "first_name"
        case phone, street, state, country, longitude
    }
    
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<User.CodingKeys> = try decoder.container(keyedBy: User.CodingKeys.self)
        
        self.id = try container.decodeIfPresent(Int.self, forKey: User.CodingKeys.id)
        self.gender = try container.decodeIfPresent(Gender.self, forKey: User.CodingKeys.gender)
        self.dateOfBirth = try container.decodeIfPresent(String.self, forKey: User.CodingKeys.dateOfBirth)
        self.job = try container.decodeIfPresent(String.self, forKey: User.CodingKeys.job)
        self.city = try container.decodeIfPresent(String.self, forKey: User.CodingKeys.city)
        self.zipcode = try container.decodeIfPresent(String.self, forKey: User.CodingKeys.zipcode)
        self.latitude = try container.decodeIfPresent(Double.self, forKey: User.CodingKeys.latitude)
        self.profilePicture = try container.decodeIfPresent(String.self, forKey: User.CodingKeys.profilePicture)
        self.email = try container.decodeIfPresent(String.self, forKey: User.CodingKeys.email)
        self.lastName = try container.decodeIfPresent(String.self, forKey: User.CodingKeys.lastName)
        self.firstName = try container.decodeIfPresent(String.self, forKey: User.CodingKeys.firstName)
        self.phone = try container.decodeIfPresent(String.self, forKey: User.CodingKeys.phone)
        self.street = try container.decodeIfPresent(String.self, forKey: User.CodingKeys.street)
        self.state = try container.decodeIfPresent(String.self, forKey: User.CodingKeys.state)
        self.country = try container.decodeIfPresent(String.self, forKey: User.CodingKeys.country)
        self.longitude = try container.decodeIfPresent(Double.self, forKey: User.CodingKeys.longitude)
    }
    
    func encode(to encoder: Encoder) throws {
        var container: KeyedEncodingContainer<User.CodingKeys> = encoder.container(keyedBy: User.CodingKeys.self)
        
        try container.encodeIfPresent(self.id, forKey: User.CodingKeys.id)
        try container.encodeIfPresent(self.gender, forKey: User.CodingKeys.gender)
        try container.encodeIfPresent(self.dateOfBirth, forKey: User.CodingKeys.dateOfBirth)
        try container.encodeIfPresent(self.job, forKey: User.CodingKeys.job)
        try container.encodeIfPresent(self.city, forKey: User.CodingKeys.city)
        try container.encodeIfPresent(self.zipcode, forKey: User.CodingKeys.zipcode)
        try container.encodeIfPresent(self.latitude, forKey: User.CodingKeys.latitude)
        try container.encodeIfPresent(self.profilePicture, forKey: User.CodingKeys.profilePicture)
        try container.encodeIfPresent(self.email, forKey: User.CodingKeys.email)
        try container.encodeIfPresent(self.lastName, forKey: User.CodingKeys.lastName)
        try container.encodeIfPresent(self.firstName, forKey: User.CodingKeys.firstName)
        try container.encodeIfPresent(self.phone, forKey: User.CodingKeys.phone)
        try container.encodeIfPresent(self.street, forKey: User.CodingKeys.street)
        try container.encodeIfPresent(self.state, forKey: User.CodingKeys.state)
        try container.encodeIfPresent(self.country, forKey: User.CodingKeys.country)
        try container.encodeIfPresent(self.longitude, forKey: User.CodingKeys.longitude)
    }
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}

