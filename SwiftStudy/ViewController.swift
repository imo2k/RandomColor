//
//  ViewController.swift
//  SwiftStudy
//
//  Created by GO on 2/17/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let colorLabel = {
        let color = UILabel()
        color.text = "R: 255, G: 255, B: 255"
        color.textAlignment = .center
        color.font = .boldSystemFont(ofSize: 24)
        return color
    }()
    
    private let changeButton = {
        let btn = UIButton()
        btn.setTitle("CHANGE COLOR", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 10
        btn.clipsToBounds = true
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.black.cgColor
        return btn
    }()
    
    private let resetButton = {
        let btn = UIButton()
        btn.setTitle("RESET", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 10
        btn.clipsToBounds = true
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.black.cgColor
        return btn
    }()
    
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureHierarchy()
        configureLayout()
        configureView()
    }

    @objc private func changeButtonClicked() {
        let randomRed = Int.random(in: 0...255)
        let randomGreen = Int.random(in: 0...255)
        let randomBlue = Int.random(in: 0...255)
        let randomColor = UIColor(red: CGFloat(randomRed) / 255.0 , green: CGFloat(randomGreen) / 255.0, blue: CGFloat(randomBlue) / 255.0, alpha: 1.0)
        
        view.backgroundColor = randomColor
        colorLabel.text = "R: \(randomRed), G: \(randomGreen), B: \(randomBlue)"
    }
    @objc private func resetButtonClicked() {
        view.backgroundColor = .white
        colorLabel.text = "R: 255, G: 255, B: 255"
    }
}

extension ViewController {
    private func configureHierarchy() {
        [colorLabel, changeButton, resetButton].forEach { view.addSubview($0) }
    }
    private func configureLayout() {
        colorLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        changeButton.snp.makeConstraints { make in
            make.top.equalTo(colorLabel.snp.bottom).offset(150)
            make.height.equalTo(50)
            make.horizontalEdges.equalToSuperview().inset(15)
        }
        resetButton.snp.makeConstraints { make in
            make.top.equalTo(changeButton.snp.bottom).offset(20)
            make.height.equalTo(50)
            make.horizontalEdges.equalToSuperview().inset(15)
        }
    }
    private func configureView() {
        changeButton.addTarget(self, action: #selector(changeButtonClicked), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetButtonClicked), for: .touchUpInside)
    }
}
