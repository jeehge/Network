//
//  ImageViewerViewController.swift
//  NetworkStudy
//
//  Created by JH on 2022/08/03.
//

import SnapKit
import Then
import UIKit

final class ImageViewerViewController: BaseViewController {
    // MARK: - UI

	private let navigationView = NavigationView()
    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.allowsMultipleSelection = false
        collectionView.isPagingEnabled = true
        collectionView.contentInsetAdjustmentBehavior = .never

        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(ImagePageCell.self, forCellWithReuseIdentifier: ImagePageCell.identifier)

        return collectionView
    }()
	
	// MARK: - Properties

	var imageUrls: [String]?
	var imageIndex = 0

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Config

    func config() {
        collectionView.backgroundColor = .clear

        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom)
            $0.leading.trailing.bottom.equalTo(view)
        }
//        DispatchQueue.main.async { [weak self] in
//            self?.collectionView.scrollToItem(at: IndexPath(item: self?.imageIndex ?? 0, section: 0), at: .left, animated: false)
//        }
//        titleLabel.text = "\(imageIndex + 1)/\(imageUrls?.count ?? 0)"
    }

    // MARK: - IBActions

    @IBAction func closeButtonTouchUpInside(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension ImageViewerViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageUrls?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImagePageCell.identifier, for: indexPath) as! ImagePageCell
        cell.setImagePageCell(url: imageUrls?[indexPath.row] ?? "")
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = Int(scrollView.frame.width)
        let offsetX = Int(scrollView.contentOffset.x + 1) // 1: Divide By Zero 방지
        imageIndex = Int(offsetX / width)
//        titleLabel.text = "\(imageIndex + 1)/\(imageUrls?.count ?? 0)"
    }
}
