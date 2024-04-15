//
//  NewsViewModel.swift
//  News App
//
//  Created by Fazli Altun on 4.03.2024.
//

import Foundation

struct NewsListViewModel {
    let newsList: [Article]
}

extension NewsListViewModel {
    func numberOfSection(_ section: Int) -> Int {
        return newsList.count
    }
    
    func newsAtIndex(_ index: Int) -> NewsViewModel{
        let news = newsList[index]
        return NewsViewModel(news: news)
    }
}

struct NewsViewModel {
    let news: Article
}

extension NewsViewModel {
    var title: String {
        return news.title
    }
    var url: String {
        return news.url
    }
    var urlToImage: String {
        guard let image = news.urlToImage else { return "" }
        return image
    }
}
