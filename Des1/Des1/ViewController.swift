//
//  loginController.swift
//  controller
//
//  Created by Nicolas Santana on 26/02/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        configureUI()
    
    }
    private lazy var background: UIView = {
       let background = UIView()
        background.backgroundColor = .white
        background.contentMode = .scaleAspectFill
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
   private lazy var text: UILabel = {
       let text = UILabel()
       text.translatesAutoresizingMaskIntoConstraints = false
       text.text = "Bitte Melde Dich an"
       text.textColor = UIColor(red: 17/255, green: 175/255, blue: 158/255, alpha: 1.0)
       text.font = UIFont.systemFont(ofSize: 40)
        return text
    }()
    private lazy var emailtextfield: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.borderWidth = 1.0
        txt.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        txt.font = UIFont.systemFont(ofSize: 15)
        txt.layer.cornerRadius = 8
        txt.textAlignment = .left
        txt.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        txt.leftViewMode = .always
        txt.layer.borderColor = UIColor(red: 17/255, green: 175/255, blue: 158/255, alpha: 1.0).cgColor
        return txt
    }()


    private lazy var passwordtextfield: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.borderWidth = 1.0
        print(txt)
        txt.attributedPlaceholder = NSAttributedString(string: "Password",attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        txt.textAlignment = .center
        txt.layer.borderColor = UIColor(red: 17/255, green: 175/255, blue: 158/255, alpha: 1.0).cgColor
        txt.font = UIFont.systemFont(ofSize: 15)
        txt.textAlignment = .left
        txt.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        txt.leftViewMode = .always
        txt.layer.cornerRadius = 8
        return txt
    }()
    private lazy var eyes: UIButton = {
        let eyes = UIButton()
        eyes.translatesAutoresizingMaskIntoConstraints = false
        eyes.setImage(UIImage(named: "eyes"), for: .normal)
        eyes.addTarget(self, action: #selector(eyesimage), for: .touchUpInside)
        passwordtextfield.isSecureTextEntry = true
        return eyes
    }()
    private lazy var  textButton: UIButton = {
        let tv = UIButton()
        tv.layer.borderWidth = 1
        tv.layer.borderColor = UIColor(red: 17/255, green: 175/255, blue: 158/255, alpha: 1.0).cgColor
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = UIColor(red: 17/255, green: 175/255, blue: 158/255, alpha: 1.0)
        tv.setTitleColor(UIColor.white, for: .normal)
        tv.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
        tv.titleLabel?.font = UIFont.systemFont(ofSize: 19)
        tv.layer.cornerRadius = 7
        tv.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        tv.adjustsImageWhenDisabled = false
        return tv
    }()
   
    func configureUI(){
        view.addSubview(background)
        background.addSubview(text)
        background.addSubview(emailtextfield)
        background.addSubview(passwordtextfield)
        passwordtextfield.addSubview(eyes)
        background.addSubview(textButton)
       
        setlayout()
    }
    func setlayout(){
        let background = [
            background.widthAnchor.constraint(equalToConstant: 400),
            background.heightAnchor.constraint(equalToConstant: 740),
            background.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            background.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ]
        let text = [
            text.centerYAnchor.constraint(equalTo: self.background.topAnchor,constant: 70),
            text.centerXAnchor.constraint(equalTo: self.background.centerXAnchor),
        ]
        
        let emailtextfield = [
            emailtextfield.centerYAnchor.constraint(equalTo: self.background.topAnchor,constant: 130),
            emailtextfield.centerXAnchor.constraint(equalTo: self.background.centerXAnchor),
            emailtextfield.widthAnchor.constraint(equalToConstant: 330),
            emailtextfield.heightAnchor.constraint(equalToConstant: 60)
        ]
        let Passwordtextfield = [
            passwordtextfield.centerYAnchor.constraint(equalTo: self.background.topAnchor,constant: 220),
            passwordtextfield.centerXAnchor.constraint(equalTo: self.background.centerXAnchor),
            passwordtextfield.widthAnchor.constraint(equalToConstant: 330),
            passwordtextfield.heightAnchor.constraint(equalToConstant: 60)
        ]
        let eyes = [
            eyes.centerYAnchor.constraint(equalTo: self.passwordtextfield.centerYAnchor),
            eyes.centerXAnchor.constraint(equalTo: self.passwordtextfield.centerXAnchor,constant: 130),
            eyes.widthAnchor.constraint(equalToConstant: 30),
            eyes.heightAnchor.constraint(equalToConstant: 30)
        ]
        let textButton = [
            textButton.centerYAnchor.constraint(equalTo: self.background.centerYAnchor,constant: -50),
            textButton.centerXAnchor.constraint(equalTo: self.background.centerXAnchor),
            textButton.widthAnchor.constraint(equalToConstant: 330),
            textButton.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        NSLayoutConstraint.activate(emailtextfield + background + Passwordtextfield + textButton + text + eyes)
    }
    @objc func loginButtonTapped() {
        let password = passwordtextfield.text ?? ""
        textButton.setTitle(password, for: .normal)
        print("Senha digitada: \(password)")
    }

    @objc private func eyesimage() {
            if eyes.currentImage == UIImage(named: "eyes") {
                eyes.setImage(UIImage(named: "close_EYES"), for: .normal)
                passwordtextfield.isSecureTextEntry = false
            } else {
                eyes.setImage(UIImage(named: "eyes"), for: .normal)
                passwordtextfield.isSecureTextEntry = true
            }
            }
    }
    






