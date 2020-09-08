//
//  ViewController.swift
//  RxLoginValidation
//
//  Created by Oscar Rodriguez Garrucho on 08/09/2020.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var statusLabel: UILabel!

    private var viewModel = ViewModel()
    private var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        _ = usernameTextField.rx.text.map { $0 ?? ""}.bind(to: viewModel.usernameText)
        _ = passwordTextField.rx.text.map { $0 ?? ""}.bind(to: viewModel.passwordText)

        // method 1
        _ = viewModel.isValid.bind(to: loginButton.rx.isEnabled)

        // method 2
        viewModel.isValid.subscribe(
            onNext: { isValid in
                // We can enable/disable the button here as well
                self.statusLabel.text = isValid ? "Button enabled" : "Button NOT enabled"
                self.statusLabel.textColor = isValid ? .systemGreen : .red
        }, onError: { error in
            print("Something was wrong! Look at here: \(error.localizedDescription)")
        }).disposed(by: disposeBag)
    }


}

