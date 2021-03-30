//
//  ApiManager.swift
//  ItnuesAPI
//
//  Created by Preeti Priyam on 3/29/21.
//

import Foundation

struct ApiManager {
    
    private var url = "https://itunes.apple.com/search?term="
    private var queryUrl = ""
    let decoder = JSONDecoder()
    
    // function to create URL
    mutating func createApiURL(_ query: String, completion: @escaping (ItuneAPIData?) -> Void){
        let subStrings = query.components(separatedBy: " ")
        var count = subStrings.count
        for subString in subStrings {
            if count > 1 {
                queryUrl += "\(subString)" + "+"
                count -= 1
            }else{
                queryUrl += "\(subString)"
            }
        }
        url = url + queryUrl
        performRequest(with : url) { (result) in
            completion(result)
        }
    }
    
    func checkResponse(data: Data?, httpResponse: HTTPURLResponse?, error : Error?) -> Bool{
            if(error != nil){
                return false
            }
            if(data == nil){
                return false
            }
            if( httpResponse?.statusCode != 200){
                return false
            }
            return true
        }
    
    //function to get the json response
    func performRequest(with url : String, completion: @escaping (ItuneAPIData?) -> Void){
        //print(url)
        if let url = URL(string: url){
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { (data, httpResponse, error) in
                guard let httpResponse = httpResponse as? HTTPURLResponse else{
                    completion(nil)
                    return
                }
                if(checkResponse(data: data, httpResponse: httpResponse, error: error)){
                    do{
                        let result = try decoder.decode(ItuneAPIData.self, from: data!)
                        //print(result)
                        completion(result)
                    }catch{
                        print(error)
                        completion(nil)
                    }
                }else{
                    completion(nil)
                    return
                }
                    
            }.resume()
        }
    }
    
}
