//
//  ViewController.swift
//  Custom alert
//
//  Created by Abdullah Alnutayfi on 18/04/2022.
//

import UIKit

class ViewController: UIViewController {
    var tag = 0
    
    lazy var stackView : UIStackView = {
        $0.axis = .horizontal
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    lazy var logo : UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(systemName: "star.fill")
        $0.tintColor = .black
        return $0
    }(UIImageView())
    lazy var alert = CustomAlert(frame: .zero, msg:"هل تود حفظ الصورة؟", alertTag: 0)
    lazy var alert2 = CustomAlert(frame: .zero, msg:  "هل تود حذف هذه الصورة؟", alertTag: 1)
    lazy var saveBtn : UIButton = {
        $0.setBackgroundImage(UIImage(systemName: "trash.fill"), for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(showAlertBut2Clicked), for: .touchDown)
        $0.tintColor = .black
        return $0
        
    }(UIButton(type: .system))
    lazy var deleteBtn : UIButton = {
        $0.setBackgroundImage(UIImage(systemName: "square.and.arrow.down.fill"), for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(showAlertButClicked), for: .touchDown)
        $0.tintColor = .black
        return $0
    }(UIButton(type: .system))
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
            
        [saveBtn,deleteBtn].forEach{stackView.addArrangedSubview($0)}
        
        alert.delegate = self
        alert2.delegate = self
        alert.isHidden = true
        alert2.isHidden = true
        logo.isHidden = true
        
        [alert,alert2,logo,stackView].forEach{view.addSubview($0)}
       
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            alert.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alert.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alert.widthAnchor.constraint(equalToConstant: 290),
            alert.heightAnchor.constraint(equalToConstant: 170),
            
            alert2.topAnchor.constraint(equalTo: saveBtn.bottomAnchor,constant: 50),
            alert2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alert2.widthAnchor.constraint(equalToConstant: 290),
            alert2.heightAnchor.constraint(equalToConstant: 170),
            
            logo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.widthAnchor.constraint(equalToConstant: 200),
            logo.heightAnchor.constraint(equalToConstant: 200)
        ])
       
    }


}

extension ViewController : btnDelegate{
    func okBtnClicked() {
        saveBtn.isEnabled = true
        deleteBtn.isEnabled = true
        if tag == 0{
        animateAleart(alert: alert, logo: logo,image: "checkmark.circle.fill",color: .systemMint)
            print("saved")
        }
        if tag == 1{
        animateAleart(alert: alert2, logo: logo,image: "checkmark.circle.fill",color: .systemMint)
            print("deleted")
        }
    }
    
    func closeBtnClicked() {
        deleteBtn.isEnabled = true
        saveBtn.isEnabled = true
        if tag == 0{
            animateAleart(alert: alert, logo: logo,image: "x.circle.fill",color: .red)
            print("saving has been interrupted")
        }
        if tag == 1{
            animateAleart(alert: alert2, logo: logo,image: "x.circle.fill",color: .red)
            print("deleting has been interrupted")
        
        }
    }
   @objc func showAlertButClicked(){
       saveBtn.isEnabled = false
       tag = alert.alertTag
       print(tag)
       animateLogo(view: alert)
       logo.isHidden = true
       self.alert.isHidden = false
           alert.center.y = UIScreen.main.bounds.height / 2
           self.alert.layoutIfNeeded()
       playAudio("ES_Multimedia Musical 1 - SFX Producer copy")
    }

    @objc func showAlertBut2Clicked(){
        deleteBtn.isEnabled = false
        tag = alert2.alertTag
        print(tag)
        animateLogo(view: alert2)
        logo.isHidden = true
        self.alert2.isHidden = false
            alert2.center.y = UIScreen.main.bounds.height / 2
            self.alert2.layoutIfNeeded()
                
        playAudio("ES_Multimedia Musical 1 - SFX Producer copy")
     }
}


