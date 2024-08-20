//
//  ViewController.swift
//  HelloWorld
//
//  Created by Marcello Chuahy on 19/08/24.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    let showHelloWorld = "Show Hello World"
    let hideHelloWorld = "Hide Hello World"
    
    var areImageAndLabelHidden = true {
        didSet {
            updateUI()
        }
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var button: UIButton!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Methods
    
    func updateUI() {

        // image
        stackView.isHidden = areImageAndLabelHidden

        // button
        let buttonTitle = areImageAndLabelHidden
                        ? showHelloWorld
                        : hideHelloWorld
        
        button.setTitle(buttonTitle, for: .normal)
   
    }

    // MARK: - Actions
    
    @IBAction func showImageAndLabel(_ sender: UIButton) {
        areImageAndLabelHidden.toggle()
    }
    
}
