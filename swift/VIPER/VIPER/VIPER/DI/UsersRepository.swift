//
//  UsersRepository.swift
//  VIPER
//
//  Created by Artur Gurgul on 28.01.23.
//

import Combine
import Foundation


private struct UsersRepositoryKey: InjectionKey {
    static var currentValue: AnyUsersRepository = UsersRepository()
}

extension InjectedValues {
    var usersRepository: AnyUsersRepository {
        get { Self[UsersRepositoryKey.self] }
        set { Self[UsersRepositoryKey.self] = newValue }
    }
}

protocol AnyUsersRepository {
    func getUsers(_ result: @escaping (Result<[User], Error>)->Void)
}

class UsersRepository: AnyUsersRepository {
    private var cancelables = Set<AnyCancellable>()
    
    func getUsers(_ result: @escaping (Result<[User], Error>)->Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        URLSession
            .shared
            .dataTaskPublisher(for: url)
            .sink(receiveCompletion: { _ in }, receiveValue: { data, response in
                do {
                    let entities = try JSONDecoder().decode([User].self, from: data)
                    result(.success(entities))
                    //self?.presenter?.interactorDidFetchUsers(with: .success(entities))
                    
                } catch {
                    //self?.presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed))
                    result(.failure(FetchError.failed))
                }
            })
            .store(in: &cancelables)
    }
}
