//
//  NewsViewController.swift
//  NewsApp
//
//  Created by Vermut xxx on 22.08.2023.
//

import UIKit
import SnapKit

final class NewsViewController: UIViewController {
    
    //MARK: - GUI Variables
    private lazy var scrollView: UIScrollView = {
        
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = true
        
        return view
    }()
    
    private lazy var contentView: UIView = UIView()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        
        view.contentMode = .scaleAspectFill
        //let width = (view.frame.width - 15) / 2
        //view.sizeThatFits(CGSize(width: 50, height: 700))
        
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        //label.textColor = .systemGray5
        
        return label
    }()
    
    
    
    
    //MARK: - Properties
    private let viewModel: NewsViewModelProtocol
    
    //MARK: - Life Cycle
    init(viewModel: NewsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false

        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews([titleLabel,
                                 imageView,
                                 descriptionLabel,
                                 dateLabel])
        
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        dateLabel.text = viewModel.date
        
        if let data = viewModel.imageData,
           let image = UIImage(data: data) {
            imageView.image = image
        } else {
            imageView.image = UIImage(named: "Image")
        }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.width.edges.equalToSuperview()
            //make.height.equalToSuperview().inset(5)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            //make.height.equalToSuperview().dividedBy(3)
            make.height.equalTo(view.snp.width)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.equalTo(imageView.snp.bottom).offset(10)
            //make.bottom.equalTo(descriptionLabel.snp.top).offset(10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
            
        }
    }
}
