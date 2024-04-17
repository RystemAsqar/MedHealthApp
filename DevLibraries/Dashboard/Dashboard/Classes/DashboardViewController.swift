//
//  DashboardViewController.swift
//  Pods
//
//  Created by Rystem Asqar on 4/15/24.
//
//

import UIKit
import SwiftUI


let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

public class DashboardViewController: UIViewController {
    
    private var customNavBar: CustomNavBar = .init()
    private var bodyView: BodyView = .init()
    
    var itemW:CGFloat {
        return screenWidth * 0.4
    }
    var itemH:CGFloat {
        return itemW * 1.45
    }
    
    let layout = CustomLayout()
    private lazy var primaryCollectionView: UICollectionView = {
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 50
        layout.minimumLineSpacing = 60
        layout.itemSize.width = 100
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
        collectionView.decelerationRate = .fast
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(PrimaryCollectionViewCell.self, forCellWithReuseIdentifier: PrimaryCollectionViewCell.IDENTIFIER)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: - Lifecycle Methods
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        
        configureViews()
        configureDelegates()
        configureConstraints()
        
        //MARK: -ConfigureUI
        let swiftUIView = CollectionView()
        let hostingController = UIHostingController(rootView: swiftUIView)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        hostingController.view.snp.makeConstraints {
            $0.top.equalTo(bodyView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
    }
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let indexPath = IndexPath(item: 1, section: 0)
        primaryCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        layout.currentPage = indexPath.item
        layout.previousOffset = layout.updateOffset(primaryCollectionView)
        if let cell = primaryCollectionView.cellForItem(at: indexPath) {
            transformCell(cell)
        }
    }
    
    // MARK: - Properties
    var presenter: ViewToPresenterDashboardProtocol?
    
}

extension DashboardViewController: PresenterToViewDashboardProtocol{
    // TODO: Implement View Output Methods
    
    func configureDelegates() {
        primaryCollectionView.dataSource = self
        primaryCollectionView.delegate = self
    }
    
    func configureViews() {
        view.addSubview(customNavBar)
        view.addSubview(bodyView)
        view.addSubview(primaryCollectionView)
    }
    func configureConstraints() {
        customNavBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(100)
        }
        bodyView.snp.makeConstraints {
            $0.top.equalTo(customNavBar.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(150)
        }
        primaryCollectionView.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-100)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(380)
            $0.height.equalTo(200)
        }
    }
}

extension DashboardViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PrimaryCollectionViewCell.IDENTIFIER, for: indexPath) as! PrimaryCollectionViewCell
        return cell
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 100)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == layout.currentPage {
            print("es che noviy ViewControllerga osy zhaqtan navigation beruge bolad")
        } else {
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            layout.currentPage = indexPath.item
            layout.previousOffset = layout.updateOffset(collectionView)
            setupCell()
        }
    }
    public func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        print("Anima")
    }
    
    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("scrolling")
    }
    
    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if decelerate {
            setupCell()
        }
    }
    
    private func setupCell() {
        let indexPath = IndexPath(item: layout.currentPage, section: 0)
        if let cell = primaryCollectionView.cellForItem(at: indexPath) {
            transformCell(cell)
        }
    }
    
    private func transformCell(_ cell: UICollectionViewCell, isEffect: Bool = true) {
        if !isEffect {
            cell.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            return
        }
        UIView.animate(withDuration: 0.2) {
            cell.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }
        
        
        for otherCell in primaryCollectionView.visibleCells {
            if let indexPath = primaryCollectionView.indexPath(for: otherCell) {
                if indexPath.item != layout.currentPage {
                    UIView.animate(withDuration: 0.2) {
                        otherCell.transform = .identity
                    }
                }
            }
        }
    }
}

