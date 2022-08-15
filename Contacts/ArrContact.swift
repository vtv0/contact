//
//  ArrContact.swift
//  Contacts
//
//  Created by Vuong The Vu on 08/08/2022.
//

import Foundation

class Person {
    public var Images: String
    public var Name: String
    public var PhoneNumber: String
    public var Email : String
    public var Company: String
    public var DateOfBirth: String
    
    
    init( images: String, name: String, phonenumber: String, email: String, company: String, dateofbirth: String) {
        self.Images = images
        self.Name = name
        self.PhoneNumber = phonenumber
        
        self.Email = email
        self.Company = company
        self.DateOfBirth = dateofbirth
    }
}
