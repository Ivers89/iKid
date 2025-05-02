//
//  ViewController.swift
//  iKid
//
//  Created by Iverson Li on 5/1/25.
//

import UIKit


class iKidTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let goodVC = JokeViewController(joke: ("Why did the picture go to prison?", "It was framed"))
        goodVC.tabBarItem = UITabBarItem(title: "Good", image: nil, tag: 0)

        let punVC = JokeViewController(joke: ("What do you call fake noodles?", "An Impasta"))
        punVC.tabBarItem = UITabBarItem(title: "Pun", image: nil, tag: 1)

        let dadVC = JokeViewController(joke: ("What do you call someone who refuses to fart in public?", "A private tutor"))
        dadVC.tabBarItem = UITabBarItem(title: "Dad", image: nil, tag: 2)

        let knockVC = KnockKnockViewController()
        knockVC.tabBarItem = UITabBarItem(title: "Knock", image: nil, tag: 3)

        viewControllers = [goodVC, punVC, dadVC, knockVC]
    }
}
