//
//  AppleView.swift
//  Login pages
//
//  Created by Madi Kupesov on 1/26/21.
//

import UIKit

class AppleView: UIView {

    lazy var appleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setUpViews()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not implemented")
    }
    
    public func setParameters(imageName: String, title: String) {
        self.titleLabel.text = title
        guard let image = UIImage(named: imageName) else { return }
        self.appleImageView.image = image
    }
        
    private func setUpViews() {
        [appleImageView, titleLabel].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        appleImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        appleImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        appleImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        appleImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: appleImageView.trailingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        
    }
    
    private func setStyle() {
        self.layer.cornerRadius = 13
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 222/255, alpha: 1).cgColor
    }
    
}
