//
//  InstagramViewController.swift
//  Login pages
//
//  Created by Madi Kupesov on 1/27/21.
//

import UIKit

class InstagramViewController: UIViewController {

// MARK: - UI Elements -
    
    lazy var backToVK: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "VK"), for: .normal)
        button.addTarget(self, action: #selector(showVK), for: .touchUpInside)
        return button
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "close"), for: .normal)
        button.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        return button
    }()
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "InstagramLogo")
        return imageView
    }()
    
    lazy var logInTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "  Nickname, email or telephone number"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 222/255, alpha: 1).cgColor
        textField.layer.cornerRadius = 8
        textField.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
        return textField
    }()
    
    lazy var info: UIButton = {
        let infoImage = UIButton()
        infoImage.setBackgroundImage(UIImage(named: "private"), for: .normal)
        infoImage.addTarget(self, action: #selector(infoAboutPassword), for: .touchUpInside)
        return infoImage
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "  Password"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 222/255, alpha: 1).cgColor
        textField.layer.cornerRadius = 8
        textField.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var forgotPasswordLabel: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot password?", for: .normal)
        button.setTitleColor(UIColor(red: 37/255, green: 142/255, blue: 237/255, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(forgotPassword), for: .touchUpInside)
        return button
    }()
    
    lazy var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.backgroundColor = UIColor(red: 142/255, green: 200/255, blue: 245/255, alpha: 1)
        button.layer.cornerRadius = 8
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var orLabel: UILabel = {
        let label = UILabel()
        label.text = "or"
        label.font = UIFont.systemFont(ofSize: 19)
        label.textColor = .lightGray
        return label
    }()
    
    lazy var enterByFacebook: FacebookUIView = {
        let viewOfFacebook = FacebookUIView()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(logInByFacebook))
        viewOfFacebook.addGestureRecognizer(gesture)
        return viewOfFacebook
    }()
    
    lazy var haveNotAccount: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 19)
        label.textColor = .lightGray
        let attrs1 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor : UIColor.lightGray]
        let attrs2 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor : UIColor(red: 37/255, green: 142/255, blue: 237/255, alpha: 1)]
        let attributedString1 = NSMutableAttributedString(string:"Haven't account?", attributes:attrs1)
        let attributedString2 = NSMutableAttributedString(string:" Register.", attributes:attrs2)
        attributedString1.append(attributedString2)
        label.attributedText = attributedString1
        return label
    }()
    
    lazy var firstLine: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        return line
    }()
    
    lazy var secondLine: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        return line
    }()
    
    lazy var thirdLine: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        return line
    }()
    
    lazy var register: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(registerProcess), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUpViews()
    }
    
    private func setUpViews() {
        [backToVK, cancelButton, logoImageView, logInTextField, passwordTextField, info, forgotPasswordLabel, enterButton, orLabel, enterByFacebook, haveNotAccount, firstLine, secondLine, thirdLine, register].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        backToVK.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height * 0.05).isActive = true
        backToVK.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        backToVK.widthAnchor.constraint(equalToConstant: 30).isActive = true
        backToVK.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        cancelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height * 0.05).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        logoImageView.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: view.bounds.height * 0.13).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        logInTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: view.bounds.height * 0.05).isActive = true
        logInTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        logInTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        logInTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: logInTextField.bottomAnchor, constant: 20).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        info.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -10).isActive = true
        info.topAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: 13).isActive = true
        info.widthAnchor.constraint(equalToConstant: 23).isActive = true
        info.heightAnchor.constraint(equalToConstant: 23).isActive = true
        
        forgotPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
        forgotPasswordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        enterButton.topAnchor.constraint(equalTo: forgotPasswordLabel.bottomAnchor, constant: 20).isActive = true
        enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        enterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        enterButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        orLabel.topAnchor.constraint(equalTo: enterButton.bottomAnchor, constant: 15).isActive = true
        orLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        orLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        enterByFacebook.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 10).isActive = true
        enterByFacebook.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        enterByFacebook.heightAnchor.constraint(equalToConstant: 50).isActive = true
        enterByFacebook.setParameters(imageName: "facebook", title: "   Log in by Facebook")
        
        haveNotAccount.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        haveNotAccount.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        haveNotAccount.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        firstLine.topAnchor.constraint(equalTo: enterButton.bottomAnchor, constant: 35).isActive = true
        firstLine.trailingAnchor.constraint(equalTo: orLabel.leadingAnchor, constant: -20).isActive = true
        firstLine.widthAnchor.constraint(equalToConstant: 150).isActive = true
        firstLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        secondLine.topAnchor.constraint(equalTo: enterButton.bottomAnchor, constant: 35).isActive = true
        secondLine.leadingAnchor.constraint(equalTo: orLabel.trailingAnchor, constant: 20).isActive = true
        secondLine.widthAnchor.constraint(equalToConstant: 150).isActive = true
        secondLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        thirdLine.bottomAnchor.constraint(equalTo: haveNotAccount.topAnchor, constant: -10).isActive = true
        thirdLine.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        thirdLine.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        thirdLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        register.trailingAnchor.constraint(equalTo: haveNotAccount.trailingAnchor, constant: 0).isActive = true
        register.centerYAnchor.constraint(equalTo: haveNotAccount.centerYAnchor).isActive = true
        register.widthAnchor.constraint(equalToConstant: 65).isActive = true
        register.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }

    
// MARK: - Actions -

    @objc func cancelAction() {
        print("Cancel button is pressed")
    }
    
    @objc func forgotPassword() {
        print("Drop password")
    }
    
    @objc func registerProcess() {
        print("New page for register")
    }
    
    @IBAction func infoAboutPassword() {
        passwordTextField.isSecureTextEntry = false
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
    
    private func displayMyAlertMessage(userMessage:String) {
        
        let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertController.Style.alert)

        let okAction = UIAlertAction(title:"Ok", style:UIAlertAction.Style.default, handler:nil)
        myAlert.addAction(okAction)

        self.present(myAlert, animated:true, completion:nil)
    }
    
    @objc func logInByFacebook(sender : UITapGestureRecognizer) {
        print("New page for verification your Facebook account")
    }
    
    @objc func showVK() {
        let mvc = MainViewController()
        mvc.modalPresentationStyle = .fullScreen
        present(mvc, animated: true, completion: nil)
    }
    
}
