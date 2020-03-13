//
//  FollowersListVC.swift
//  GitApp
//
//  Created by Prudhvi Gadiraju on 3/11/20.
//  Copyright © 2020 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class FollowersListVC: UIViewController {
    
    enum Section { case main }
    
    var username: String?
    var page: Int = 1
    var hasMoreFollowers: Bool = true
    var followers: [Follower] = [] { didSet { updateData() }}
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getFollowers(in: page)
        setupDatasource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
    
    private func getFollowers(in page: Int) {
        guard let username = username else { return }
        showLoadingView()
        NetworkManger.shared.getFollowers(for: username, page: page) { [weak self] result in
            guard let self = self else { return }
            self.hideLoadingView()
            switch result {
            case .success(let followers):
                self.followers.append(contentsOf: followers)
                if followers.count < 100 { self.hasMoreFollowers = false }
                if followers.isEmpty { self.showEmptyStateView(with: "This user has no followers. Maybe follow them?", in: self.view) }
            case .failure(let error):       self.presentGAAlert(title: error.title, message: error.localizedDescription, buttonText: "Ok")
            }
        }
    }
    
    private func setupDatasource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
            cell.set(follower: follower)
            return cell
        })
    }
    
    private func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers, toSection: .main)
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true, completion: nil) }
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        setupCollectionView()
    }
    
    private func setupNavBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnFlowLayout())
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
        view.addSubview(collectionView)
    }
}

extension FollowersListVC: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard hasMoreFollowers else { return }
            page += 1
            getFollowers(in: page)
        }
    }
}
