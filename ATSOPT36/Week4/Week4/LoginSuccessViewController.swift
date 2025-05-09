//
//  LoginSuccessViewController.swift
//  Week4
//
//  Created by 권석기 on 5/9/25.
//

import UIKit

import SnapKit

final class LoginSuccessViewController: UIViewController {
    
    private var userId: String
    private var nickname: String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubView()
        setLayout()
        bind()
        // Do any additional setup after loading the view.
    }
    
    init(userId: String, nickname: String) {
        self.userId = userId
        self.nickname = nickname
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let nicknameLabel = UILabel().then {
        $0.text = "닉네임"
        $0.textColor = .black
    }
    
    private lazy var nicknameTextField = UITextField().then {
        $0.borderStyle = .roundedRect
        $0.backgroundColor = .lightGray
        $0.addTarget(self, action: #selector(nicknameChanged(sender:)), for: .editingChanged)
    }
    
    private lazy var setNicknameButton = UIButton().then {
        $0.setTitle("닉네임 변경", for: .normal)
        $0.configuration = .bordered()
        $0.addTarget(self, action: #selector(setNicknameButtonTapped), for: .touchUpInside)
    }
    
    private func addSubView() {
        [nicknameLabel, nicknameTextField, setNicknameButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        nicknameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(100)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(50)
        }
        
        setNicknameButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(50)
        }
    }
    
    func bind() {
        self.nicknameLabel.text = nickname
    }
    
    @objc func setNicknameButtonTapped() {
        performNicknameChange()
    }
    
    @objc func nicknameChanged(sender: UITextField) {
        guard let nickname = sender.text else { return }
        self.nickname = nickname
    }
    
    private func performNicknameChange() {
        Task {
            do {                
                let response = try await NicknameService.shared.patchNicknameData(userId: userId, nickname: nickname)
                nicknameLabel.text = nickname
            } catch {
                let alert = UIAlertController(
                    title: "닉네임 변경 실패",
                    message: error.localizedDescription,
                    preferredStyle: .alert
                )
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                
                print("닉네임 변경 에러:", error)
            }
        }
    }
}
