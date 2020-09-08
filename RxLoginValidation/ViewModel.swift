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
    var usernameText = PublishSubject<String>()
    var passwordText = PublishSubject<String>()

    func isValid() -> Observable<Bool> {
        return Observable.combineLatest(usernameText.asObservable(),
                                        passwordText.asObservable()).map { username, password in
                                            username.count >= 4 && password.count >= 4
        }.startWith(false)
    }
}
