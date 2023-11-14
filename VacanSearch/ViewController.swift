//
//  ViewController.swift
//  VacanSearch
//
//  Created by Anastasiia Bugaeva on 14.11.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemMint
        
        let label = UILabel()
        label.text = "Panda!"
        label.textColor = .systemIndigo
        label.font = .monospacedSystemFont(ofSize: 50, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

