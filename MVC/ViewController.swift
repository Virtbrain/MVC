//
//  ViewController.swift
//  MVC
//
//  Created by Alexey Manankov on 26.08.2023.
//

import UIKit

//MARK: - View + Controller
class GreetingViewController: UIViewController {
    
    let showGretteingButton = UIButton()
    let greetingLabel = UILabel()
    
    let person = Person(firstName: "David", lastName: "Blaine")

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Model View Controller"
        setupView()
        
    }
    
    private func setupView() {
        [greetingLabel, showGretteingButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        greetingLabel.font = UIFont.boldSystemFont(ofSize: 25)
        showGretteingButton.backgroundColor = .green
        showGretteingButton.setTitle("Show greeting", for: .normal)
        showGretteingButton.setTitleColor(.black, for: .normal)
        showGretteingButton.setTitleColor(UIColor.init(white: 1, alpha: 0.3), for: .highlighted)
        showGretteingButton.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            greetingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            greetingLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            showGretteingButton.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 40),
            showGretteingButton.widthAnchor.constraint(equalToConstant: 200),
            showGretteingButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            showGretteingButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        showGretteingButton.addTarget(self, action: #selector(didTapGreetingButton), for: .touchUpInside)
    }
    
    @objc private func didTapGreetingButton() {
        let greeting = "Hello" + " " + self.person.firstName + " " + self.person.lastName
        self.greetingLabel.text = greeting
    }
}
