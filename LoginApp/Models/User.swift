//
//  UserData.swift
//  LoginApp
//
//  Created by Maxim Datsuk on 07.07.2022.
//

import Foundation

struct User {
    let login: String
    let password: String
    let personalInfo: [Person]
    
    static func getUserInfo() -> User {
        User(
            login: "User",
            password: "1234",
            personalInfo: [
                Person(name: "Max", description: "For screen 1", image: "me.png"),
                Person(name: "Max", description: "For screen 1.1", image: "cat.png"),
                Person(name: "Max", description: "For screen 2", image: "friends.png")
            ]
        )
    }
}

struct Person {
    let name: String
    let description: String
    let image: String
}
