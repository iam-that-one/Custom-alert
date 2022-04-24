//
//  CustomAlert.swift
//  Custom alert
//
//  Created by Abdullah Alnutayfi on 18/04/2022.
//

import UIKit

protocol btnDelegate : AnyObject {
    func closeBtnClicked()
    func okBtnClicked()
}
class CustomAlert: UIView{
    var delegate : btnDelegate?
    var msg : String
    var alertTag : Int
    
    lazy var close : UIButton = {
        $0.setBackgroundImage(UIImage(systemName: "x.circle"), for: .normal)
        $0.tintColor = .white
        $0.layer.cornerRadius = 25
        $0.backgroundColor = .red
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(closeBtnClicked), for: .touchDown)
        return $0
    }(UIButton(type: .system))
    
    lazy var ok : UIButton = {
        $0.setBackgroundImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        $0.tintColor = .white
        $0.layer.cornerRadius = 25
        $0.backgroundColor = .systemMint
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(okBtnClicked), for: .touchDown)
        return $0
    }(UIButton(type: .system))
    
    lazy var message : UILabel = {
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = msg
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        return $0
    }(UILabel())
    init(frame: CGRect, msg: String, alertTag : Int) {
        self.msg = msg
        self.alertTag = alertTag
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        
        self.layer.cornerRadius = 20
        self.layer.shadowOpacity = .pi
        self.layer.shadowColor = .init(gray: 0.50, alpha: 1)
        self.backgroundColor = .white
        
        [close,ok,message].forEach{self.addSubview($0)}
        NSLayoutConstraint.activate([
            close.topAnchor.constraint(equalTo: self.topAnchor,constant: -25),
            close.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            close.heightAnchor.constraint(equalToConstant: 50),
            close.widthAnchor.constraint(equalToConstant: 50),
            
            message.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            message.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            ok.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 25),
            ok.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            ok.heightAnchor.constraint(equalToConstant: 50),
            ok.widthAnchor.constraint(equalToConstant: 50)
          
        ])
    }
    @objc func closeBtnClicked(){
                   if let _ = delegate {
                       self.delegate!.closeBtnClicked()
                 }
    }
    @objc func okBtnClicked(){
                   if let _ = delegate {
                       self.delegate!.okBtnClicked()
                 }
    }
}
