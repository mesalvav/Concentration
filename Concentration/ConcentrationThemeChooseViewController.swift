//
//  ConcentrationThemeChooseViewController.swift
//  Concentration
//
//  Created by mariosalvatierra on 3/2/20.
//  Copyright © 2020 mariosalvatierra. All rights reserved.
//

import UIKit

class ConcentrationThemeChooseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    // MARK: - Themes
    
    let themes = [
        "Sports":"⚽️🏀🏈⚾️🎾🏐🏉🎱🏓⛷🎳⛳️",
        "Animals":"🐶🐔🦊🐼🦀🐪🐓🐋🐙🦄🐵",
        "Faces":"😀😂😎😫😰😴🙄🤔😘😁"
    ]
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                }
            }
            
        }
        // Pass the selected object to the new view controller.
    }
    

    
}
