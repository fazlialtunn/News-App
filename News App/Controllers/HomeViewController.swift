//
//  HomeViewController.swift
//  News App
//
//  Created by Fazlı Altun on 3.03.2024.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Home"
    }
}

