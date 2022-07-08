//
//  GeneralRoute.swift
//  ParsoTest-iOS
//
//  Created by Angelber Castro on 7/7/22.
//

import Foundation
import UIKit

enum GeneralRoute: IRouter {
    case UserProfile
}

extension GeneralRoute {
    var scene: UIViewController? {
        switch self {
        case .UserProfile:
            return UserProfileViewController()
        }
    }
}
