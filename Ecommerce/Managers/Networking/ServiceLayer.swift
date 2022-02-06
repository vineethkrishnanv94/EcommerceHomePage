//
//  ServiceLayer.swift
//  Ecommerce
//
//  Created by Vk on 06/02/22.
//

import Foundation
import Alamofire
class ServiceLayer {
        
    static var sessionManager: Session = {
      var configuration = URLSessionConfiguration.af.default
      return Session(
        configuration: configuration
        )
    }()

    
    
    class func makeRequest<T: Decodable>(to router: Router, method: HTTPMethod = .post, parameters: Parameters? = nil, parameterEncoding: ParameterEncoding = JSONEncoding.default, responseType:T.Type, completion: @escaping (Result<T?, Error>) -> Void) {
        var headers: HTTPHeaders = ["Content-Type": "application/json; charset=utf-8"]

        request(to: router, method: method, headers: headers, parameters: parameters, parameterEncoding: parameterEncoding, responseType: responseType, completion: completion)
    }
    
    
    private class func request<T: Decodable>(to router: Router, method: HTTPMethod, headers: HTTPHeaders, parameters: Parameters? = nil, parameterEncoding: ParameterEncoding = JSONEncoding.default, responseType:T.Type, completion: @escaping (Result<T?, Error>) -> Void)  {

        sessionManager.request(router.path, method: method, parameters: parameters, encoding: parameterEncoding, headers: headers).validate().response { response in
            switch response.result {
            
            case .success(let data):
                do {
                    
                    if let data = data {
                        print("Response Data - \(router.path) : ", String(data: data, encoding: .utf8) ?? "")

                        let parsedData = try JSONDecoder().decode(APIResponse<T>.self, from: data)
                        if parsedData.code == 200 {
                            completion(.success(parsedData.data))
                        }
                    }
                } catch(let error) {
                    print("Router", router.path)
                    print("Response failed without data", error.localizedDescription)
                    return completion(.failure(error))
                }
                
            case .failure(let error):
                print("Router", router.path)
                print("Response failed with error", error.localizedDescription)
                return completion(.failure(error))
            }
        }
    }
    
}
