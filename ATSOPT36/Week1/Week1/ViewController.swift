//
//  ViewController.swift
//  Week1
//
//  Created by 권석기 on 4/5/25.
//

import UIKit

class ViewController: UIViewController {

    private var testView: UIView = UIView(frame: .init(origin: .init(x: 100, y: 100),
                                                       size: .init(width: 150, height: 150)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        testView.backgroundColor = .magenta
        
        self.view.addSubview(testView)
    }
}


