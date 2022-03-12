//
//  SignInService.swift
//  Volunet
//
//  Created by Софья Тимохина on 08.03.2022.
//

import Foundation

protocol ISignInService {
    func signIn(email: String, password: String, completion: @escaping (Result<Profile?, Error>) -> Void)
}

final class SignInService: ISignInService {
    private static var _shared: ISignInService?

    let queue = DispatchQueue(label: "SignInService")

    let mockedProfile = Profile(uuid: "1",
                                name: "Саша",
                                events: [UserEvent(event: Event(startDate: "1", title: "1", description: "2", ownerName: "23"), mark: 12.2, comment: "Comment"),
                                         UserEvent(event: Event(startDate: "1", title: "1", description: "2", ownerName: "23"), mark: 12.2, comment: "Comment")],
                                specialHealthFeatures: ["test", "test"],
                                imageUrl: "image",
                                avards: [Avard(title: "Шарики - детям", image: .add)])

    static var shared: ISignInService {
        guard let instance = SignInService._shared else {
            SignInService._shared = SignInService()
            return SignInService._shared!
        }
        return instance
    }

    func signIn(email: String, password: String, completion: @escaping (Result<Profile?, Error>) -> Void) {
        queue.async { [weak self] in
            DispatchQueue.main.async {
                // TODO: fix sign in
                completion(.success(self?.mockedProfile))
            }
        }
    }
}