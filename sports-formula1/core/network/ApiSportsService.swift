//
//  ApiSportsHttpClient.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 25.08.2023.
//

import Foundation
import Combine

protocol ApiSportsServiceProtocol {
    func getRaces() async throws -> AnyPublisher<RacesResponse,Error>
    func getTeamRankings() async throws -> AnyPublisher<TeamRankingsResponse,Error>
    func getDriverRankings() async throws -> AnyPublisher<DriverRankingsResponse,Error>
    func getCircuits() async throws -> AnyPublisher<CircuitsResponse,Error>
}

class ApiSportsService: ApiSportsServiceProtocol {
    
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
    
    private func getServiceRequest <T: Codable>(_ t: T.Type, endpoint: String) async throws -> AnyPublisher<T,Error>  {
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
    
    func getRaces() async throws ->  AnyPublisher<RacesResponse,Error>  {
        return try await getServiceRequest(RacesResponse.self, endpoint: "races?season=2023&type=race")
    }
    
    func getTeamRankings() async throws -> AnyPublisher<TeamRankingsResponse, Error> {
        return try await getServiceRequest(TeamRankingsResponse.self, endpoint: "rankings/teams?season=2023")
    }
    
    func getDriverRankings() async throws -> AnyPublisher<DriverRankingsResponse, Error> {
        return try await getServiceRequest(DriverRankingsResponse.self, endpoint: "rankings/drivers?season=2023")
    }
    
    func getCircuits() async throws -> AnyPublisher<CircuitsResponse, Error> {
        return try await getServiceRequest(CircuitsResponse.self, endpoint: "circuits")
    }
}


class MockedApiSportsService : ApiSportsServiceProtocol {
    
    func getRaces() async throws -> AnyPublisher<RacesResponse, Error> {
        return Just(
            RacesResponse.init(items: [
                RacesResponseItem.init(id: 1,
                                       competition: CompetitionDto.init(id: 1,
                                                                        name: "Competition-1",
                                                                        location: LocationDto.init(country: "Country-1", city: "City-1")),
                                       circuit: CircuitDto.init(id: 1, name: "Circuit-1"),
                                       date: "2023-07-30T13:00:00+00:00"),
                RacesResponseItem.init(id: 2,
                                       competition: CompetitionDto.init(id: 2,
                                                                        name: "Competition-2",
                                                                        location: LocationDto.init(country: "Country-2", city: "City-2")),
                                       circuit: CircuitDto.init(id: 2, name: "Circuit-2"),
                                       date: "2023-07-30T13:00:00+00:00"),
                RacesResponseItem.init(id: 3,
                                       competition: CompetitionDto.init(id: 3,
                                                                        name: "Competition-3",
                                                                        location: LocationDto.init(country: "Country-3", city: "City-3")),
                                       circuit: CircuitDto.init(id: 3, name: "Circuit-3"),
                                       date: "2023-07-30T13:00:00+00:00"),
            ])
        )
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    }
    
    func getTeamRankings() async throws -> AnyPublisher<TeamRankingsResponse, Error> {
        return Just(
            TeamRankingsResponse.init(items: [
                TeamRankingItem.init(position: 1,
                                     team: TeamDto.init(id: 1,
                                                        name: "Team 1",
                                                        logo: "https://media.api-sports.io/formula-1/teams/1.png"),
                                     points: 333),
                TeamRankingItem.init(position: 2,
                                     team: TeamDto.init(id: 2,
                                                        name: "Team 2",
                                                        logo: "https://media.api-sports.io/formula-1/teams/2.png"),
                                     points: 222),
                TeamRankingItem.init(position: 3,
                                     team: TeamDto.init(id: 3,
                                                        name: "Team 3",
                                                        logo: "https://media.api-sports.io/formula-1/teams/3.png"),
                                     points: 111)
            ])
        )
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    }
    
    func getDriverRankings() async throws -> AnyPublisher<DriverRankingsResponse, Error> {
        return Just(
            DriverRankingsResponse.init(items: [
                DriverRankingItem.init(position: 1, driver: DriverDto.init(id: 1, name: "Driver-1", number: 1, image: "https://media-3.api-sports.io/formula-1/drivers/1.png"),
                                       team: TeamDto.init(id: 1, name: "Team-1", logo: "https://media.api-sports.io/formula-1/teams/1.png"),
                                       points: 123),
                
                DriverRankingItem.init(position: 2, driver: DriverDto.init(id: 2, name: "Driver-2", number: 2, image: "https://media-3.api-sports.io/formula-1/drivers/2.png"),
                                       team: TeamDto.init(id: 1, name: "Team-2", logo: "https://media.api-sports.io/formula-1/teams/2.png"),
                                       points: 124),
                
                DriverRankingItem.init(position: 3, driver: DriverDto.init(id: 3, name: "Driver-3", number: 3, image: "https://media-3.api-sports.io/formula-1/drivers/3.png"),
                                       team: TeamDto.init(id: 1, name: "Team-3", logo: "https://media.api-sports.io/formula-1/teams/3.png"),
                                       points: 125),
                
                DriverRankingItem.init(position: 4, driver: DriverDto.init(id: 4, name: "Driver-4", number: 4, image: "https://media-3.api-sports.io/formula-1/drivers/4.png"),
                                       team: TeamDto.init(id: 1, name: "Team-4", logo: "https://media.api-sports.io/formula-1/teams/4.png"),
                                       points: 126)
            ])
        )
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    }
    
    func getCircuits() async throws -> AnyPublisher<CircuitsResponse, Error> {
        return Just(
            CircuitsResponse.init(items: [
                CircuitsResponseItem.init(id: 1,
                                          name: "Melbourne Grand Prix Circuit",
                                          image: "https://media.api-sports.io/formula-1/circuits/1.png",
                                          competition: CompetitionDto.init(id: 1, name: "Australia Grand Prix", location: LocationDto(country: "Australia", city: "Melbourne")),
                                          firstGrandPrix: 1996,
                                          laps: 56,
                                          length: "5.303 Kms",
                                          raceDistance: "307.574 kms"),
                CircuitsResponseItem.init(id: 2,
                                          name: "Melbourne Grand Prix Circuit",
                                          image: "https://media.api-sports.io/formula-1/circuits/1.png",
                                          competition: CompetitionDto.init(id: 1, name: "Australia Grand Prix", location: LocationDto(country: "Australia", city: "Melbourne")),
                                          firstGrandPrix: 1996,
                                          laps: 56,
                                          length: "5.303 Kms",
                                          raceDistance: "307.574 kms"),
                CircuitsResponseItem.init(id: 3,
                                          name: "Melbourne Grand Prix Circuit",
                                          image: "https://media.api-sports.io/formula-1/circuits/1.png",
                                          competition: CompetitionDto.init(id: 1, name: "Australia Grand Prix", location: LocationDto(country: "Australia", city: "Melbourne")),
                                          firstGrandPrix: 1996,
                                          laps: 56,
                                          length: "5.303 Kms",
                                          raceDistance: "307.574 kms"),
                CircuitsResponseItem.init(id: 4,
                                          name: "Melbourne Grand Prix Circuit",
                                          image: "https://media.api-sports.io/formula-1/circuits/1.png",
                                          competition: CompetitionDto.init(id: 1, name: "Australia Grand Prix", location: LocationDto(country: "Australia", city: "Melbourne")),
                                          firstGrandPrix: 1996,
                                          laps: 56,
                                          length: "5.303 Kms",
                                          raceDistance: "307.574 kms")
            ])
        )
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    }
}

