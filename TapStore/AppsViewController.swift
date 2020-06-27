//
//  AppsViewController.swift
//  TapStore
//
//  Created by Tanaka Mazivanhanga on 6/27/20.
//  Copyright © 2020 Tanaka Mazivanhanga. All rights reserved.
//

import UIKit

class AppsViewController: UIViewController {
    let sections = Bundle.main.decode([Section].self, from: "appstore.json")
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, App>?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompossitionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)

        collectionView.register(FeaturedCollectionViewCell.self, forCellWithReuseIdentifier: FeaturedCollectionViewCell.reuseIdentifier)

        createDataSource()
        reloadData()
    }

    func configure<T: SelfConfiguringCell>(_ cellType: T.Type, with app: App, for  indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to deque \(cellType)")
        }
        cell.configure(with: app)
        return cell
    }

    func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, App>(collectionView: collectionView){ collectionView, indexPath, app in
            switch self.sections[indexPath.section].type{
            case .featured:
                print("Enum worked")
                return self.configure(FeaturedCollectionViewCell.self, with: app, for: indexPath)

            default:
                return self.configure(FeaturedCollectionViewCell.self, with: app, for: indexPath)
            }
        }
    }

    func reloadData(){
        var snapshot = NSDiffableDataSourceSnapshot<Section, App>()
        snapshot.appendSections(sections)

        sections.forEach { (section) in
            snapshot.appendItems(section.items, toSection: section)
        }

        dataSource?.apply(snapshot)
    }


    func createFeaturedSection(using seection:Section)-> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)

        layoutItem.contentInsets = .init(top: 0, leading: 12, bottom: 0, trailing: 12)

        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .estimated(350))

        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])

        let layoutSection: NSCollectionLayoutSection = NSCollectionLayoutSection(group: layoutGroup)

        layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
        
        return layoutSection
    }

    func createCompossitionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout {
            sectionIndex, layoutEnviroment in
            let section = self.sections[sectionIndex]
            switch section.type {
            case .featured:
                return self.createFeaturedSection(using: section)
            default:
                return self.createFeaturedSection(using: section)
            }
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        return layout
    }
}

