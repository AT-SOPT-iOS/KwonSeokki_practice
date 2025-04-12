//
//  WelcomeViewController.swift
//  Week1
//
//  Created by 권석기 on 4/5/25.
//

import UIKit

class WelcomeViewController_DelegatePattern: UIViewController {
    private var id: String?
    weak var delegate: DataBindingDelegate?
    
    private lazy var backToLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 35, y: 498, width: 335, height: 58))
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize:  18)
        button.clipsToBounds = false
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var goToLMainButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 35, y: 425, width: 335, height: 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.clipsToBounds = false
        button.layer.cornerRadius = 6
        button.titleLabel?.font = .systemFont(ofSize:  18)
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private let welcomeImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "welcomImage")
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 300, width: 95, height: 60))
        label.text = "???님 \n반가워요"
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(welcomeImage)
        view.addSubview(welcomeLabel)
        view.addSubview(goToLMainButton)
        view.addSubview(backToLoginButton)
        bindID()
        // Do any additional setup after loading the view.
    }
    
    func bindID() {
        self.welcomeLabel.text = "\(id ?? "")님 \n반가워요!"
    }
    
    func setLabelText(id: String?) {
        self.id = id
    }
        
    @objc func backToLoginButtonDidTap() {
        if let id = id {
            delegate?.dataBind(id: id)
        }
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
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
