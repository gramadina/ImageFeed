//
//  SingleImageViewController.swift
//  ImageFeed
//
//  Created by Daria Granina on 27.05.2024.
//

import UIKit

final class SingleImageViewController: UIViewController {
    var image: UIImage? {
        didSet {
            guard isViewLoaded else {return}
            singleImage.image = image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        singleImage.image = image
    }
    
    @IBAction private func tapBackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet private weak var singleImage: UIImageView!

}


