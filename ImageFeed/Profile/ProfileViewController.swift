//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Daria Granina on 22.05.2024.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let profileImage = UIImage(named: "profilePhoto")
        let imageView = UIImageView (image: profileImage)
        imageView.tintColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameLabel = UILabel()
    private lazy var nickLabel = UILabel()
    private lazy var descriptionLabel = UILabel()
    
    private lazy var logoutButton = UIButton.systemButton(
        with: UIImage(systemName: "ipad.and.arrow.forward")!,
        target: self,
        action: #selector(Self.tapLogOutButton)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeProfilePhoto()
        makeNameLabel()
        makeNickLabel()
        makeDescriptionLabel()
        makeLogOutButton()
    }
    
    private func makeProfilePhoto() {
        view.addSubview(imageView)
        
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    private func makeNameLabel() {
        nameLabel.text = "Екатерина Новикова"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 23)
        nameLabel.textColor = .ypWhite
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
    }
    
    private func makeNickLabel() {
        nickLabel.text = "@ekaterina_nov"
        nickLabel.font = UIFont.systemFont(ofSize: 13)
        nickLabel.textColor = .ypGray
        
        nickLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nickLabel)
        
        nickLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        nickLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
    }
    
    private func makeDescriptionLabel() {
        descriptionLabel.text = "Hello, world!"
        descriptionLabel.font = UIFont.systemFont(ofSize: 13)
        descriptionLabel.textColor = .ypWhite
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        
        descriptionLabel.topAnchor.constraint(equalTo: nickLabel.bottomAnchor, constant: 8).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
    }
    
    private func makeLogOutButton() {
        logoutButton.tintColor = .red
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoutButton)
        
        logoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        logoutButton.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
    }
    
    @objc private func tapLogOutButton() {
        for view in view.subviews {
            if view is UILabel {
                view.removeFromSuperview()
            }
        }
    }
}

