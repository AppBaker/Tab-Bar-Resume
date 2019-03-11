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
    private var isNightMode: Bool = false {
        didSet {
            if nightModeButton != nil {
            setMode()
            }

        }
    }
    

    //MARK: - ...@IBOutlets
    @IBOutlet weak var nightModeButton: UIBarItem!
    @IBOutlet weak var resumeTextField: UITextView!
    
    
    //MARK: ...IBActions
    @IBAction func callButtonPressed(_ sender: UIButton) {
        callMe(tel)
    }
    @IBAction func emailButtonPressed(_ sender: UIButton) {
        emailMe(to: email)
    }
    @IBAction func nightModeToggle(_ sender: UIBarItem) {
        isNightMode = !isNightMode
        setNightModInTabBarView()
    }
    @IBAction func ballCaunterAppPressed(){
        let url = URL(string: "https://itunes.apple.com/ru/app//id1366219288?mt=8")!
        if UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    //MARK: - ...Dovnload functions
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if nightModeButton != nil {
            print("Wiew vill apear")
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
        
        tabBarController?.viewControllers?.forEach({ (vc) in
            
            if let navCont = vc as? UINavigationController {
                navCont.viewControllers.forEach({ (vc) in
                    if let viewController = vc as? ViewController {
                        viewController.isNightMode = isNightMode
                    }
                })
            }
//
        })
    }
    
    private func setMode() {
//        guard let mode = isNightMode else {return}
        if isNightMode == false {
            view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
            tabBarController?.tabBar.barStyle = .default
            navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)]
            nightModeButton.title = "night"
            if resumeTextField != nil {
            resumeTextField.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
            resumeTextField.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
            }
            

        } else if isNightMode != false {
            view.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
            tabBarController?.tabBar.barStyle = .black
            navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)]
            nightModeButton.title = "light"
            if resumeTextField != nil {
                resumeTextField.textColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
                resumeTextField.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
            }

        }
    }
}

