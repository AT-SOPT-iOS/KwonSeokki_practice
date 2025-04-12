//
//  ScrollViewPraticeViewController.swift
//  Week2
//
//  Created by 권석기 on 4/12/25.
//

import UIKit

final class ScrollViewPraticeViewController: UIViewController {
    // MARK: - View
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let redView = UIView()
    private let orangeView = UIView()
    private let yellowView = UIView()
    private let greenView = UIView()
    private let blueView = UIView()
    private let purpleView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
        // Do any additional setup after loading the view.
    }
    
    private func setLayout() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        redView.translatesAutoresizingMaskIntoConstraints = false
        orangeView.translatesAutoresizingMaskIntoConstraints = false
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        greenView.translatesAutoresizingMaskIntoConstraints = false
        blueView.translatesAutoresizingMaskIntoConstraints = false
        purpleView.translatesAutoresizingMaskIntoConstraints = false
        
        redView.backgroundColor = .red
        orangeView.backgroundColor = .orange
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = .green
        blueView.backgroundColor = .blue
        purpleView.backgroundColor = .purple
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [redView, orangeView, yellowView, greenView, blueView, purpleView].forEach {
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                        
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            
            redView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            redView.topAnchor.constraint(equalTo: contentView.topAnchor),
            redView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            redView.heightAnchor.constraint(equalToConstant: 300),
            
            orangeView.leadingAnchor.constraint(equalTo: redView.trailingAnchor),
            orangeView.topAnchor.constraint(equalTo: contentView.topAnchor),
            orangeView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            orangeView.heightAnchor.constraint(equalToConstant: 300),
            
            yellowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            yellowView.topAnchor.constraint(equalTo: redView.bottomAnchor),
            yellowView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            yellowView.heightAnchor.constraint(equalToConstant: 300),
            
            greenView.leadingAnchor.constraint(equalTo: yellowView.trailingAnchor),
            greenView.topAnchor.constraint(equalTo: orangeView.bottomAnchor),
            greenView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            greenView.heightAnchor.constraint(equalToConstant: 300),
            
            blueView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            blueView.topAnchor.constraint(equalTo: yellowView.bottomAnchor),
            blueView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            blueView.heightAnchor.constraint(equalToConstant: 300),
            
            purpleView.leadingAnchor.constraint(equalTo: blueView.trailingAnchor),
            purpleView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
            purpleView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            purpleView.heightAnchor.constraint(equalToConstant: 300),
            purpleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
