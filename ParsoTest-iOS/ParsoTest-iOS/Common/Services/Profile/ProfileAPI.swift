//
//  ProfileAPI.swift
//  ParsoTest-iOS
//
//  Created by Angelber Castro on 7/7/22.
//

import Foundation

protocol ProfileServiceProtocol {
    func getUserPorfile(request: ProfileUser.Profile.Request ,completion: @escaping (Result<ProfileUser.Profile.Response, ProfileError>) -> Void)

}

class ProfileAPI: ProfileServiceProtocol {
    func getUserPorfile(request: ProfileUser.Profile.Request, completion: @escaping (Result<ProfileUser.Profile.Response, ProfileError>) -> Void) {
        NetworkService.share.request(endpoint: ProfileEndpoint.getProfile) { result in
            switch result {
            case .success:
                do {
                    let data = try result.get()
                    let response = try JSONDecoder().decode(ProfileUser.Profile.Response.self, from: data!)
                    completion(.success(response))
                } catch let error {
                    completion(.failure(.parse(error)))
                }
            case .failure(let error):
                completion(.failure(.network(error)))
            }
        }
    }
}
