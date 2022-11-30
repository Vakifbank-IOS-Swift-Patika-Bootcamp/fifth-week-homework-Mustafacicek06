//
//  Client.swift
//  BreakingBad
//
//  Created by Mustafa Çiçek on 26.11.2022.
//

import Foundation


class Client {
    
  
       
       @discardableResult
       class func taskForGETRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) -> URLSessionDataTask {
           let task = URLSession.shared.dataTask(with: url) { data, response, error in
               guard let data = data else {
                   DispatchQueue.main.async {
                       completion(nil, error)
                   }
                   return
               }
               let decoder = JSONDecoder()
               do {
                   let responseObject = try decoder.decode(ResponseType.self, from: data)
                   DispatchQueue.main.async {
                       completion(responseObject, nil)
                   }
               } catch {
                   do {
                       let errorResponse = try decoder.decode(BaseResponse.self, from: data) as Error
                       DispatchQueue.main.async {
                           completion(nil, errorResponse)
                       }
                   } catch {
                       DispatchQueue.main.async {
                           completion(nil, error)
                       }
                   }
               }
           }
           task.resume()

           return task
       }

}

enum Endpoints {
       static let base = "https://www.breakingbadapi.com/api/"

       case characters
       case quotes(Int)
       case episodes
    
       var stringValue: String {
           switch self {
           case .characters:
               return Endpoints.base + "characters"
           case .episodes:
               return Endpoints.base +  "episodes"
           case .quotes(let characterID):
               return Endpoints.base + "quotes/\(characterID)"
           }
       }

       var url: URL {
           return URL(string: stringValue)!
       }
   }
