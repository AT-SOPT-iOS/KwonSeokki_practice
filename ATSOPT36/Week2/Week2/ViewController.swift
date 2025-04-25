//
//  ViewController.swift
//  Week2
//
//  Created by 권석기 on 4/12/25.
//

import UIKit

class ViewController: UIViewController {
    private let yellowBox: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()
    
    private let greenwBox: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()
    
    private let blackBox: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    private let blueBox: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setLayout()
    }
    
    private let width = UIScreen.main.bounds.width / 2
    private let height = UIScreen.main.bounds.height / 4

    func setLayout() {
        view.addSubview(yellowBox)
        view.addSubview(greenwBox)
        view.addSubview(blackBox)
        view.addSubview(blueBox)
        view.addSubview(yellowBox)
        NSLayoutConstraint.activate([
            // 변수 사용
//            yellowBox.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            yellowBox.topAnchor.constraint(equalTo: view.topAnchor),
//            yellowBox.widthAnchor.constraint(equalToConstant: width),
//            yellowBox.heightAnchor.constraint(equalToConstant: height),
//            
//            greenwBox.widthAnchor.constraint(equalToConstant: width),
//            greenwBox.heightAnchor.constraint(equalToConstant: height),
//            greenwBox.leadingAnchor.constraint(equalTo: yellowBox.trailingAnchor),
//            greenwBox.topAnchor.constraint(equalTo: yellowBox.bottomAnchor),
//            
//            blackBox.widthAnchor.constraint(equalToConstant: width),
//            blackBox.heightAnchor.constraint(equalToConstant: height),
//            blackBox.topAnchor.constraint(equalTo: greenwBox.bottomAnchor),
//            blackBox.trailingAnchor.constraint(equalTo: greenwBox.leadingAnchor),
//            
//            blueBox.widthAnchor.constraint(equalToConstant: width),
//            blueBox.heightAnchor.constraint(equalToConstant: height),
//            blueBox.leadingAnchor.constraint(equalTo: blackBox.trailingAnchor),
//            blueBox.topAnchor.constraint(equalTo: blackBox.bottomAnchor),
            
            // multiplier 사용
            yellowBox.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            yellowBox.topAnchor.constraint(equalTo: view.topAnchor),
            yellowBox.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            yellowBox.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
            
            greenwBox.leadingAnchor.constraint(equalTo: yellowBox.trailingAnchor),
            greenwBox.topAnchor.constraint(equalTo: yellowBox.bottomAnchor),
            greenwBox.widthAnchor.constraint(equalTo: yellowBox.widthAnchor),
            greenwBox.heightAnchor.constraint(equalTo: yellowBox.heightAnchor),
            
            blackBox.trailingAnchor.constraint(equalTo: greenwBox.leadingAnchor),
            blackBox.topAnchor.constraint(equalTo: greenwBox.bottomAnchor),
            blackBox.widthAnchor.constraint(equalTo: yellowBox.widthAnchor),
            blackBox.heightAnchor.constraint(equalTo: yellowBox.heightAnchor),
            
            blueBox.leadingAnchor.constraint(equalTo: blackBox.trailingAnchor),
            blueBox.topAnchor.constraint(equalTo: blackBox.bottomAnchor),
            blueBox.widthAnchor.constraint(equalTo: yellowBox.widthAnchor),
            blueBox.heightAnchor.constraint(equalTo: yellowBox.heightAnchor),
        ])
    }
}

