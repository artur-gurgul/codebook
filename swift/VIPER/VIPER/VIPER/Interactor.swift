//
//  Interactor.swift
//  VIPER
//
//  Created by Artur Gurgul on 28.01.23.
//

import Foundation
import Combine

enum FetchError: Error {
    case failed
}

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
    
    func getUsers()
}

class UserInteractor: AnyInteractor {
    private var cancelables = Set<AnyCancellable>()
    var presenter: AnyPresenter?
    
    func getUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        URLSession
            .shared
            .dataTaskPublisher(for: url)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] data, response in
                do {
                    let entities = try JSONDecoder().decode([User].self, from: data)
                    self?.presenter?.interactorDidFetchUsers(with: .success(entities))
                } catch {
                    self?.presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed))
                }
            })
            .store(in: &cancelables)
    }
}
