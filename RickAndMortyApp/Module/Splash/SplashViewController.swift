//
//  SplashViewController.swift
//  RickAndMortyApp
//
//  Created by Abdullah Bozkus on 11.07.2022.
//

import UIKit
import SnapKit

protocol SplashViewControllerProtocol: AnyObject {
    func noInternetConnection()
}

class SplashViewController: UIViewController {
    
    private lazy var imageContentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "RickAndMorty")
        return imageView
    }()

    var presenter: SplashPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.imageContentView)
        self.imageContentView.addSubview(self.imageView)
        self.setupLayout()
        presenter.viewDidAppear()
    }
    
    private func setupLayout() {
        
        self.imageContentView.snp.makeConstraints { [weak self] (make) in
            guard let self = self else {return}
            make.leading.trailing.top.width.height.equalToSuperview()
        }
        
        self.imageView.snp.makeConstraints { [weak self] (make) in
            guard let self = self else {return}
            make.width.equalTo(self.imageContentView.snp.width).multipliedBy(0.8)
            make.height.equalTo(self.imageView.snp.width)
            make.center.equalTo(view.snp.center)
        }
    }
    
    func showAlert(title:String, message:String) {
        DispatchQueue.main.async {
            self.exitAppAlert(message: message, title: title)
        }
    }
}

extension SplashViewController: SplashViewControllerProtocol {
    
    func noInternetConnection() {
        showAlert(title: "Error", message: "No Internet Connection, Please check your connection")
    }
}
