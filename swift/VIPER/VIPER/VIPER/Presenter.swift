//
//  Presenter.swift
//  VIPER
//
//  Created by Artur Gurgul on 28.01.23.
//

import Foundation


protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    
    func interactorDidFetchUsers(with result: Result<[User], Error>)
}

class UserPresenter: AnyPresenter {
    func interactorDidFetchUsers(with result: Result<[User], Error>) {
        switch result {
        case let .success(users):
            view?.update(with: users)
        case let .failure(error):
            view?.update(with: error.localizedDescription)
        }
    }
    
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.getUsers()
        }
    }
    
    var view: AnyView?
    
    
}
