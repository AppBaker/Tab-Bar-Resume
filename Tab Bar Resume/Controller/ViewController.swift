//
//  ViewController.swift
//  Tab Bar Resume
//
//  Created by Ivan Nikitin on 07/03/2019.
//  Copyright © 2019 Ivan Nikitin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let tel = "+79029237735"
    private let email = "qqaqq@ya.ru"
    private var isNightMode: Bool? {
        didSet {
            if nightModeButton != nil {
            setMode()
            }

        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNightMode = true
    }
    
    @IBOutlet weak var nightModeButton: UIBarItem!
    
    //MARK: ...IBActions
    @IBAction func callButtonPressed(_ sender: UIButton) {
        callMe(tel)
    }
    @IBAction func emailButtonPressed(_ sender: UIButton) {
        emailMe(to: email)
    }
    @IBAction func nightModeToggle(_ sender: UIBarItem) {
        isNightMode = !isNightMode!
        setNightModInTabBarView()
        
    }
    
    //MARK: - ...Dovnload functions
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if nightModeButton != nil {
            setMode()
        }
    }
    
    //MARK: - ... Contact functions
    func callMe(_ number: String) {
        let url = URL(string: "tel://\(number)")!
        if UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    func emailMe(to email: String) {
        let url = URL(string: "mailto://\(email)")!
        if UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    //MARK: - ...NightModeToggle function
    
    private func setNightModInTabBarView() {
        tabBarController?.viewControllers?.forEach({ (viewController) in
            guard let viewController = viewController as? ViewController else {return}
            
            viewController.isNightMode = isNightMode
        })
    }
    
    private func setMode() {
        guard let mode = isNightMode else {return}
        if mode == false {
            view.backgroundColor = .white
            tabBarController?.tabBar.barStyle = .default
            navigationController?.navigationBar.barTintColor = .white
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)]
            nightModeButton.title = "night"

        } else if mode != false {
            view.backgroundColor = .black
            tabBarController?.tabBar.barStyle = .black
            navigationController?.navigationBar.barTintColor = .black
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)]
            nightModeButton.title = "light"

        }
    }
}

