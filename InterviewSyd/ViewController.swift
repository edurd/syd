//
//  ViewController.swift
//  InterviewSyd
//
//  Created by Eduardo Hoyos on 22/10/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate,  UICollectionViewDelegateFlowLayout {

    var collectionView: UICollectionView?
    var cells = [ItemCell]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1..<100 {
            let by10 = i % 10
            let by5 = i % 5
            if by10 == 0 && by5 == 0 {
                cells.append(ItemCell(celltype: .max))
            } else if by5 == 0 {
                cells.append(ItemCell(celltype: .med))
            } else {
                cells.append(ItemCell(celltype: .min))
            }
        }
        
        view.backgroundColor = .white
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 2
        flowLayout.itemSize = CGSize(width: 20, height: 80)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.register(BarCollectionViewCell.self, forCellWithReuseIdentifier: "BarCollectionViewCell")
        guard let collectionView else {return}
        view.addSubview(collectionView)
        setupConstraints()
    }

    func setupConstraints() {
        guard let collectionView else {return}
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            collectionView.heightAnchor.constraint(equalToConstant: 70)
        ])
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BarCollectionViewCell", for: indexPath) as? BarCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(type: cells[indexPath.item].celltype)
        
        return cell
    }

//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        switch cells[indexPath.item].celltype {
//        case .max:
//            return CGSize(width: 2, height: 80)
//        case .med:
//            return CGSize(width: 2, height: 50)
//        case .min:
//            return CGSize(width: 2, height: 20)
//        }
//    }
    
}

struct ItemCell {
    var celltype: CellType
}

enum CellType {
    case min
    case med
    case max
}
