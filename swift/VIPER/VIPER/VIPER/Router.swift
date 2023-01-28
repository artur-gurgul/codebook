//
//  Router.swift
//  VIPER
//
//  Created by Artur Gurgul on 28.01.23.
//

import Foundation
import UIKit

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? { get }
    static func start() -> AnyRouter
}

class UserRouter: AnyRouter {
    var entry: EntryPoint?
    
    
    static func start() -> AnyRouter {
        let router = UserRouter()
        
        var view: AnyView = UserViewController()
        var presenter: AnyPresenter = UserPresenter()
        var interactor: AnyInteractor = UserInteractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as? EntryPoint
        
        return router
    }
}



//There are a few retain cycles with view, presenter, router and interactor. One option you can do is to make those protocols conforms to AnyObject, and mark these references as "weak":
//1. router's ref to presenter
//2. router's ref to view
//3. presenter's ref to view
//4. interactor's ref to presenter

