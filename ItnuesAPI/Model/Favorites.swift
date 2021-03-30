//
//  Favorites.swift
//  ItnuesAPI
//
//  Created by Preeti Priyam on 3/30/21.
//

import Foundation

struct Favorites {
    static var favoriteItems: [FavoriteItem] = []
    
    func addFavorite(trackName: String, kind: String){
        let item = FavoriteItem(trackName: trackName, kind: kind)
        Favorites.favoriteItems.append(item)
        Favorites.favoriteItems.sort { (item1, item2) -> Bool in
            item1.kind < item2.kind
        }
    }
    func deleteFavourite(trackName: String, kind: String){
        for (index,favorite) in Favorites.favoriteItems.enumerated(){
            if(favorite.trackName == trackName && favorite.kind == kind){
                Favorites.favoriteItems.remove(at: index)
                return
            }
        }
    }
}

struct FavoriteItem {
    var trackName : String
    var kind: String
}
