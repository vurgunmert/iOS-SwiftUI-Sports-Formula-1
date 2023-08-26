//
//  ApiSportsHttpClient.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 25.08.2023.
//

import Foundation
import Combine

class ApiSportsHttpClient {
    private let baseUrlString = "https://v1.formula-1.api-sports.io/"
    private let authHeaderKey = "x-rapidapi-key"
    private let authHeaderValue = "b049b3527733bfbf098106fc59b5523d"
    private let jsonHeaderKey = "Content-Type"
    private let jsonHeaderValue = "application/json"
    
    private func createRequest(endpoint: String) -> URLRequest {
        
        let url = URL(string: "https://v1.formula-1.api-sports.io/" + endpoint)!
        
        var request = URLRequest(url: url)
        request.setValue("b049b3527733bfbf098106fc59b5523d", forHTTPHeaderField: "x-rapidapi-key")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return request
    }
    
    func getServiceRequest <T: Codable>(_ t: T.Type, endpoint: String) async throws -> AnyPublisher<T, Publishers.Decode<Publishers.TryMap<URLSession.DataTaskPublisher, JSONDecoder.Input>, T, JSONDecoder>.Failure> {
        let request = createRequest(endpoint: endpoint)
        
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { element -> Data in
                print("REQUEST TIME" + Date().ISO8601Format())
                guard let response = element.response as? HTTPURLResponse,
                      (200...299).contains(response.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: t, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
//    func getTeamRanking() -> AnyPublisher<TeamRankingsResponse, Publishers.Decode<Publishers.TryMap<URLSession.DataTaskPublisher, JSONDecoder.Input>, TeamRankingsResponse, JSONDecoder>.Failure> {
//        let request = createRequest(endpoint: "rankings/teams?season=2023")
//
//        return URLSession.shared
//            .dataTaskPublisher(for: request)
//            .tryMap { element -> Data in
//                guard let response = element.response as? HTTPURLResponse,
//                      (200...299).contains(response.statusCode) else {
//                    throw URLError(.badServerResponse)
//                }
//                return element.data
//            }
//            .decode(type: TeamRankingsResponse.self, decoder: JSONDecoder())
//            .eraseToAnyPublisher()
//    }
//

//    lazy var teamRanking = self.getServiceRequest(TeamRankingsResponse.self, endpoint: "rankings/teams?season=2023")
    }
