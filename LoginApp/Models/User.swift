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
    let person: Person
    
    static func getUserData() -> User {
        User(
            login: "Max",
            password: "123",
            person: Person.getPerson()
        )
    }
}

struct Person {
    let userName: String
    let name: String
    let surname: String
    let age: String
    let photo: String
    let job: Company
    let hobby: Hobby
    let pet: Pet
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(
            userName: "Maxim Datsuk",
            name: "Максим",
            surname: "Дацук",
            age: "24",
            photo: "Me",
            job: Company.getCompany(),
            hobby: Hobby.getHobby(),
            pet: Pet.getPet())
    }
}

struct Company {
    let name: String
    let department: String
    let title: String
    let experience: String
    let logo: String
    
    static func getCompany() -> Company {
        Company(
            name: "Софт Инжиниринг",
            department: "Качества и системной аналитики",
            title: "Инженер-тестировщик",
            experience: "3 года",
            logo: "Job"
        )
    }
}

struct Hobby {
    let description: String
    let photo: String
    
    static func getHobby() -> Hobby {
        Hobby(
            description: "Свободного времени не так много, но если удается его найти, то встречаюсь с друзьями",
            photo: "Friends")
    }
}

struct Pet {
    let name: String
    let age: String
    let photo: String
    
    var description: String {
        "А еще у меня есть такой котик☺️"
    }
    
    static func getPet() -> Pet {
        Pet(
            name: "Тимофей",
            age: "7 лет",
            photo: "Pet"
        )
    }
}
