//
//  UserProfilePresenter.swift
//  ParsoTest-iOS
//
//  Created by Angelber Castro on 7/7/22.
//

import Foundation

protocol ProfilePresentationLogic {
    func presentProfile(response: ProfileUser.Profile.Response)
    func presentError(response: ProfileUser.Error.Response)
}

class ProfilePresenter: ProfilePresentationLogic {
    
    weak var viewController: ProfileDisplayLogic?
   
    // MARK: - Present Profile
    func presentProfile(response: ProfileUser.Profile.Response) {
        let viewModel = ProfileUser.Profile.ViewModel(results: response.results, infoData: response.info)
        viewController?.displayProfile(viewModel: viewModel, on: .main)
    }
    
    // MARK: - Present Error
    func presentError(response: ProfileUser.Error.Response) {
        let viewModel = ProfileUser.Error.ViewModel(error: response.error)
        viewController?.displayError(viewModel: viewModel, on: .main)
    }
}
