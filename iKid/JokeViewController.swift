//
//  JokeViewController.swift
//  iKid
//
//  Created by Iverson Li on 5/1/25.
//

import UIKit

class JokeViewController: UIViewController {
    
    private let joke: (question: String, answer: String)
    private var isShowingAnswer = false
    private let jokeLabel = UILabel()
    private let nextButton = UIButton(type: .system)

    init(joke: (String, String)) {
        self.joke = joke
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
        setupButton()
        showQuestion()
    }

    private func setupLabel() {
        jokeLabel.translatesAutoresizingMaskIntoConstraints = false
        jokeLabel.textAlignment = .center
        jokeLabel.numberOfLines = 0
        jokeLabel.font = UIFont.systemFont(ofSize: 28)
        view.addSubview(jokeLabel)

        NSLayoutConstraint.activate([
            jokeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            jokeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -15),
            jokeLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
            jokeLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20)
        ])
    }

    private func setupButton() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Next", for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        nextButton.addTarget(self, action: #selector(flipJoke), for: .touchUpInside)
        view.addSubview(nextButton)

        NSLayoutConstraint.activate([
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80)
        ])
    }

    @objc private func flipJoke() {
        let toText = isShowingAnswer ? joke.question : joke.answer
        let options: UIView.AnimationOptions = isShowingAnswer ? .transitionFlipFromRight : .transitionFlipFromLeft
        UIView.transition(with: jokeLabel, duration: 0.5, options: options, animations: {
            self.jokeLabel.text = toText
        })

        isShowingAnswer.toggle()
    }

    private func showQuestion() {
        jokeLabel.text = joke.question
        isShowingAnswer = false
    }
}
