//
//  MainViewController.swift
//  Login pages
//
//  Created by Madi Kupesov on 1/25/21.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var goToInstagram: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "instagram (1)"), for: .normal)
        button.addTarget(self, action: #selector(showInstagram), for: .touchUpInside)
        return button
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "close"), for: .normal)
        button.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        return button
    }()
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "VK")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var logInTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = " Email or telephone number"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 222/255, alpha: 1).cgColor
        textField.layer.cornerRadius = 13
        textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        textField.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 243/255, alpha: 1)
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = " Password"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 222/255, alpha: 1).cgColor
        textField.layer.cornerRadius = 13
        textField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        textField.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 243/255, alpha: 1)
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var info: UIButton = {
        let infoImage = UIButton()
        infoImage.setBackgroundImage(UIImage(named: "info-button"), for: .normal)
        infoImage.addTarget(self, action: #selector(infoAboutPassword), for: .touchUpInside)
        return infoImage
    }()
    
    lazy var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.backgroundColor = UIColor(red: 168/255, green: 194/255, blue: 229/255, alpha: 1)
        button.layer.cornerRadius = 13
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var enterByAppleView: AppleView = {
        let viewOfApple = AppleView()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(logInByApple))
        viewOfApple.addGestureRecognizer(gesture)
        return viewOfApple
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUpViews()
    }
    
    private func setUpViews() {
        [cancelButton, goToInstagram, iconImageView, logInTextField, passwordTextField, info, enterButton, enterByAppleView].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        cancelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 22).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 22).isActive = true
    
        goToInstagram.topAnchor.constraint(equalTo: view.topAnchor, constant: 44).isActive = true
        goToInstagram.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        goToInstagram.widthAnchor.constraint(equalToConstant: 40).isActive = true
        goToInstagram.heightAnchor.constraint(equalToConstant: 40).isActive = true

        iconImageView.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: view.bounds.height * 0.17).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        logInTextField.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: view.bounds.height * 0.05).isActive = true
        logInTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        logInTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        logInTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: logInTextField.bottomAnchor).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        info.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -10).isActive = true
        info.topAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: 13).isActive = true
        info.widthAnchor.constraint(equalToConstant: 23).isActive = true
        info.heightAnchor.constraint(equalToConstant: 23).isActive = true
        
        enterButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
        enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        enterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        enterButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        enterByAppleView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
        enterByAppleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        enterByAppleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        enterByAppleView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        enterByAppleView.setParameters(imageName: "apple", title: "Log in by Apple")
    }
    
// MARK: - Actions -
    
    private func displayMyAlertMessage(userMessage:String) {
        
        let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertController.Style.alert)

        let okAction = UIAlertAction(title:"Ok", style:UIAlertAction.Style.default, handler:nil)
        myAlert.addAction(okAction)

        self.present(myAlert, animated:true, completion:nil)
    }
    
    @IBAction func logInButtonTapped() {
        let userLogIn = logInTextField.text
        let userPassword = passwordTextField.text
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        let passwordRegEx = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
        let telephoneNumberRegEx = "^[7]\\d{9}$"
        let predForPassword = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        let predForLogInEmail = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        let predForLogInTelephoneNumber = NSPredicate(format: "SELF MATCHES %@", telephoneNumberRegEx)
        if predForPassword.evaluate(with: userPassword) && (predForLogInEmail.evaluate(with: userLogIn) || predForLogInTelephoneNumber.evaluate(with: userLogIn)) {
            print("It's okay")
        }
        else {
            displayMyAlertMessage(userMessage: "Password is invalid")
        }
    }
    
    @IBAction func infoAboutPassword() {
        passwordTextField.isSecureTextEntry = false
    }

    @objc func logInByApple(sender : UITapGestureRecognizer) {
        print("New page for verification your Apple ID")
    }
    
    @objc func cancelAction(sender : UITapGestureRecognizer) {
        print("Cancel button is pressed")
    }
    
    @objc func showInstagram() {
        let ivc = InstagramViewController()
        ivc.modalPresentationStyle = .fullScreen
        present(ivc, animated: true, completion: nil)
    }
}


