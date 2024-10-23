//
//  BarCollectionViewCell.swift
//  InterviewSyd
//
//  Created by Eduardo Hoyos on 22/10/24.
//

import Foundation
import UIKit

class BarCollectionViewCell: UICollectionViewCell {
    
    let barView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .black
        return view
    }()

    lazy var topConstraint = NSLayoutConstraint(item: barView,
                                                attribute: .top,
                                                relatedBy: .equal,
                                                toItem: contentView,
                                                attribute: .top,
                                                multiplier: 1,
                                                constant: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    func setupViews() {
        contentView.addSubview(barView)
        
        NSLayoutConstraint.activate([
            topConstraint,
            barView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            barView.widthAnchor.constraint(equalToConstant: 3),
            barView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

    func configure(type: CellType) {
        topConstraint.isActive = false
        switch type {
        case .min:
            topConstraint.constant = 50
        case .med:
            topConstraint.constant = 30
        case .max:
            topConstraint.constant = 0
        }
        topConstraint.isActive = true
    }
    
}
