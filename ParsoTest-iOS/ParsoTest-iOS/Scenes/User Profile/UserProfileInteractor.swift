//
//  UserProfileInteractor.swift
//  ParsoTest-iOS
//
//  Created by Angelber Castro on 7/7/22.
//


import Foundation
import UIKit

protocol ProfileBusinessLogic {
    func profile(request: ProfileUser.Profile.Request)
}

protocol ProfileDataStore {
}

class ProfileInteractor: ProfileBusinessLogic, ProfileDataStore {
    
    var presenter: ProfilePresentationLogic?
    var worker: ProfileServiceProtocol
     
    init(worker: ProfileServiceProtocol = ProfileAPI()) {
        self.worker = worker
    }
    
    // MARK: - Methods -
    // Handling the request and will return a response object to the Presenter.
    func profile(request: ProfileUser.Profile.Request) {
        worker.getUserPorfile(request: request, completion: { result in
            switch result {
            case .success(let response):
                self.presenter?.presentProfile(response: response)
            case .failure(let error):
                let response = ProfileUser.Error.Response(error: error)
                self.presenter?.presentError(response: response)
            }
        })
    }
}
