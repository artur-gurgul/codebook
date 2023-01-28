//
//  Interactor.swift
//  VIPER
//
//  Created by Artur Gurgul on 28.01.23.
//

import Foundation

enum FetchError: Error {
    case failed
}

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
    
    func getUsers()
}

class UserInteractor: AnyInteractor {
    @Injected(\.usersRepository) var usersRepository: AnyUsersRepository
    
    var presenter: AnyPresenter?
    
    func getUsers() {
        usersRepository.getUsers { [weak self] in self?.presenter?.interactorDidFetchUsers(with: $0) }
    }
}
