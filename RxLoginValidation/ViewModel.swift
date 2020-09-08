//
//  ViewModel.swift
//  RxLoginValidation
//
//  Created by Oscar Rodriguez Garrucho on 08/09/2020.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import Foundation
import RxSwift

struct ViewModel {
    var usernameText = BehaviorSubject<String>(value: "") // default value is empty string
    var passwordText = BehaviorSubject<String>(value: "")

    var isValid: Observable<Bool> {
        return Observable.combineLatest(usernameText.asObservable(),
                                        passwordText.asObservable()) { username, password in
            username.count >= 4 && password.count >= 4
        }
    }
}
