//
//  FacebookUIView.swift
//  Login pages
//
//  Created by Madi Kupesov on 1/28/21.
//

import UIKit

class FacebookUIView: UIView {

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not implemented")
    }
    
    lazy var facebookLogo: UIImageView = {
        let logo = UIImageView()
        logo.contentMode = .scaleAspectFit
        return logo
    }()
    
    lazy var logInByFacebook: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(red: 37/255, green: 142/255, blue: 237/255, alpha: 1)
        return label
    }()
    
    public func setParameters(imageName: String, title: String) {
        self.logInByFacebook.text = title
        guard let image = UIImage(named: imageName) else { return }
        self.facebookLogo.image = image
    }
    
    private func setUpViews() {
        [facebookLogo, logInByFacebook].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        facebookLogo.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        facebookLogo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        facebookLogo.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        facebookLogo.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        logInByFacebook.leadingAnchor.constraint(equalTo: facebookLogo.trailingAnchor).isActive = true
        logInByFacebook.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        logInByFacebook.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        logInByFacebook.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
    }
    
}
