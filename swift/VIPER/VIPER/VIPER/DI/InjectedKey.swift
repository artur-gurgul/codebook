//
//  InjectedKey.swift
//  VIPER
//
//  Created by Artur Gurgul on 29.01.23.
//

import Foundation

public protocol InjectionKey {
    associatedtype Value
    static var currentValue: Self.Value { get set }
}
