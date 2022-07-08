//
//  UserProfileRouter.swift
//  ParsoTest-iOS
//
//  Created by Angelber Castro on 7/7/22.
//

import Foundation

@objc protocol ProfileRoutingLogic {
}

protocol ProfileDataPassing {
    var dataStore: ProfileDataStore? { get }
}

class ProfileRouter: NSObject, ProfileRoutingLogic, ProfileDataPassing {
    weak var viewController: UserProfileViewController?
    var dataStore: ProfileDataStore?
    
}
