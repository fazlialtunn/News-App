//
//  HomeViewController.swift
//  News App
//
//  Created by Fazlı Altun on 3.03.2024.
//

import UIKit
import SDWebImage

class HomeViewController: UIViewController {
    
    var viewModel: NewsListViewModel!
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Home"
        getData()
        configureTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func configureTableView(){
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
    }
    func getData() {
        print("get data ")
        APICaller().fetchData { result in
            print("result in")
            switch result {
            case .success(let articles):
                print("Result: \(result)")
                self.viewModel = NewsListViewModel(newsList: articles ?? [])
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
                print("failure")
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(viewModel)
        return viewModel == nil ? 0 : viewModel.numberOfSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
        let index = viewModel.newsAtIndex(indexPath.row)
        cell.titleLabel.text = index.title
        cell.newsImage.sd_setImage(with: URL(string: index.urlToImage))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}
