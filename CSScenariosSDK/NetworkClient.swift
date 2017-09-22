//
//  NetworkClient.swift
//  CSScenariosSDK
//
//  Created by František Kratochvíl on 19.09.17.
//  Copyright © 2017 Applifting. All rights reserved.
//

import UIKit

public let headerAccept = "accept"
public let headerContentType = "content-type"
public let headerWebApiKey = "web-api-key"
public let headerAcceptLanguage = "accept-language"
public let headerAuthorization = "authorization"

/// HTTP method enum
///
/// - get: GET HTTP method
/// - post: POST HTTP method
/// - put: PUT HTTP method
/// - delete: DELETE HTTP method
enum HTTPMethod: String {
    case get    = "GET"
    case post   = "POST"
    case put    = "PUT"
    case delete = "DELETE"
}

/// Result enum to return from Api calls
///
/// - error: Error result with underlying error
/// - success: Success result with response and data
enum ApiResult {
    case error(error: ApiError)
    case success(response: URLResponse?, data: Any?)
}

/// API errors
///
/// - malformedURL: Malformed URL error. The URL string cannot be converted to URL object.
/// - serializationError: Error when serializing object to JSON
/// - serverError: General network error
/// - httpStatusError: Thrown when HTTP status other then 200 is returned 
enum ApiError: Error {
    case malformedURL(String)
    case serializationError(String)
    case serverError(Error)
    case httpStatusError(String)
}

/// Simple network service client
class NetworkClient: NSObject {
    
    var headers: [String:String] = [:]
    var session: URLSession
    var baseUrl: String
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
        self.session = URLSession(configuration: URLSessionConfiguration.default)
        
        self.headers = [
            headerAccept       : "application/json;charset=UTF-8",
            headerContentType  : "application/json;charset=UTF-8"
        ]
    }

    /// Add HTTP header to the client to be used with each following request
    ///
    /// - Parameters:
    ///   - key: HTTP header name
    ///   - value: HTTP header value
    public func addHeader(key:String, value:String) {
        headers[key] = value
    }
    
    /// Call network service
    ///
    /// - Parameters:
    ///   - url: Service URL
    ///   - method: HTTP method
    ///   - body: Optional HTTP body
    ///   - completion: Completion method
    public func callApi(url: String, method: HTTPMethod, body: Data?, completion:@escaping(ApiResult)->()) {
        let serviceUrl = "\(self.baseUrl)\(url)"
        
        guard let theURL = URL(string: serviceUrl) else {
            completion(.error(error: .malformedURL("Malformed url: \(url)")))
            return
        }
        
        var request = URLRequest(url: theURL)
        request.httpMethod = method.rawValue
        request.httpBody = body
        
        self.headers.forEach { (key: String, value: String) in
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        self.session.dataTask(with: request) { (data, response, error) in
            if let theError = error {
                completion(.error(error: .serverError(theError)))
            }
            else {
                if let httpResponse = response as? HTTPURLResponse {
                    switch httpResponse.statusCode {
                    
                    case 200:
                        completion(.success(response:response, data:data))
                    
                    default:
                        if let theData = data {
                            let dataString = String(data: theData, encoding: .utf8)
                            print(dataString ?? "")
                        }
                        
                        completion(.error(error: .httpStatusError("HTTP Status: \(httpResponse.statusCode)")))
                    }
                }
            }
        }.resume()
    }
    
    /// Call network service.
    ///
    /// - Parameters:
    ///   - url: Service URL
    ///   - method: HTTP method
    ///   - object: Object that will be serialized as JSON and sent in the request body
    ///   - completion: Completion
    public func callApi(url: String, method: HTTPMethod, object: JSONSerializable?, completion:@escaping(ApiResult)->()) {
        if let value = object {
            if let data = value.toJSONData() {
                callApi(url: url, method: method, body: data, completion: completion)
            }
            else {
                completion(.error(error: .serializationError("JSON serialization error.")))
            }
        }
        else {
            callApi(url: url, method: method, body: nil, completion: completion)
        }
    }
    
    /// Call network service.
    ///
    /// - Parameters:
    ///   - url: Service URL
    ///   - method: HTTP method
    ///   - objects: Array of objects that will be serialized as JSON and sent in the request body
    ///   - completion: Completion
    public func callApi(url: String, method: HTTPMethod, objects: [JSONSerializable]?, completion:@escaping(ApiResult)->()) {
        if let values = objects  {
            let json = values.map({ $0.JSONRepresentation() })
            do {
                let data = try JSONSerialization.data(withJSONObject: json, options: [])
                callApi(url: url, method: method, body: data, completion: completion)
            } catch {
                completion(.error(error: .serializationError("JSON serialization error.")))
            }
        }
        else {
            callApi(url: url, method: method, body: nil, completion: completion)
        }
    }
}
