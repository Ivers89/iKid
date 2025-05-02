//
//  KnockKnockViewController.swift
//  iKid
//
//  Created by Iverson Li on 5/1/25.
//


import UIKit

class KnockKnockViewController: UIViewController {
    private let jokeSteps = [
        "Knock knock.",
        "Who's there?",
        "Optional",
        "Optional who?",
        "Optional you didn't unwrap me safely!"
    ]
    
    private var currentStep = 0
    private let jokeLabel = UILabel()
    private let nextButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLabel()
        setupButton()
        showStep()
    }

    private func setupLabel() {
        jokeLabel.translatesAutoresizingMaskIntoConstraints = false
        jokeLabel.textAlignment = .center
        jokeLabel.numberOfLines = 0
        jokeLabel.font = UIFont.systemFont(ofSize: 28)
        view.addSubview(jokeLabel)

        NSLayoutConstraint.activate([
            jokeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            jokeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            jokeLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
            jokeLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20)
        ])
    }

    private func setupButton() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Next", for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        nextButton.addTarget(self, action: #selector(nextStep), for: .touchUpInside)
        view.addSubview(nextButton)

        NSLayoutConstraint.activate([
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80)
        ])
    }

    @objc private func nextStep() {
        currentStep = (currentStep + 1) % jokeSteps.count

        UIView.transition(with: jokeLabel, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            self.jokeLabel.text = self.jokeSteps[self.currentStep]
        })
    }

    private func showStep() {
        jokeLabel.text = jokeSteps[currentStep]
    }
}
