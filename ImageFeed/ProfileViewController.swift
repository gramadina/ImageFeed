//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Daria Granina on 22.05.2024.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    @IBOutlet private var photoImage: UIImageView!
    @IBAction private func tapLogoutButton(_ sender: Any) {}
    @IBOutlet private var logoutButton: UIButton!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var nickLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
