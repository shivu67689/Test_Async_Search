//
//  Networking_Service.swift
//  test_test
//
//  Created by Shivakumarswami Hiremath on 13/12/21.
//

import Foundation




class NetWorking_Sarvice {
    
    
    
    func GetMovies(queryString:String,completion: @escaping ( DataModel?, String?) -> ()) {
        let APIKEY = "ZXRWl2aKtLTMBU1EICrNzZoZBijOQyQa"
        guard let escapedSearchText: String = queryString.addingPercentEncoding(withAllowedCharacters:.urlHostAllowed) else {return}
        
        guard let final_url = URL(string: "https://api.nytimes.com/svc/movies/v2/reviews/search.json?query=\(escapedSearchText)&api-key=\(APIKEY)") else {return}
        
        
        
        var request = URLRequest(url: final_url,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        
        let session = URLSession.shared
           session.dataTask(with: request) { (data, response, error) in
            
            
            guard let data = data else {
              print(String(describing: error))
  
                completion(nil, "Error: \(String(describing: error?.localizedDescription))")
  
              return
            }
            do {
             let decoder = JSONDecoder()
             decoder.dateDecodingStrategy = .iso8601
             let model = try decoder.decode(DataModel.self, from: data)
             completion( model, nil)
            } catch {
                completion(nil, "Error: \(String(describing: error.localizedDescription))")
            }

           }.resume()
        

        
       
    
        
        
        
    }
}




