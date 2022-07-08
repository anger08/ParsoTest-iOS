//
//  UserProfileModels.swift
//  ParsoTest-iOS
//
//  Created by Angelber Castro on 7/7/22.
//

import Foundation
import UIKit

enum ProfileUser {
  
    // MARK: Use cases
    enum Profile {
        struct Request {
            //method get
        }
        
        struct Response: Codable {
            let results: [Results]
            let info: Info
            
            enum CodingKeys: String, CodingKey {
                case results
                case info
            }
        }
        
        struct ViewModel {
            let results: [Results]
            let infoData: Info
        }
    }

    enum Error {
        struct Request {
        }
        struct Response {
            var error: ProfileError
        }
        struct ViewModel {
            var error: ProfileError
        }
    }
}
