//
//  Ranking.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 26.08.2023.
//

import Foundation
import Combine

@MainActor
class Ranking: ObservableObject  {
    
    private let client: ApiSportsHttpClient
    private var cancellable = Set<AnyCancellable>()

    @Published private(set) var teams: [TeamModel] = .init() {
        didSet {
            if oldValue != teams { objectWillChange.send() }
        }
    }
    
    @Published private(set) var drivers: [DriverModel] = .init() {
        didSet {
            if oldValue != drivers { objectWillChange.send() }
        }
    }
    
    init(client: ApiSportsHttpClient) {
        self.client = client
    }

    func loadTeams() async throws {
        
        func convertDomainToUIModel(item: TeamRankingItem) -> TeamModel {
            return TeamModel(id: item.team.id,
                             position: item.position,
                             name: item.team.name,
                             points: item.points,
                             imageUrl: item.team.logo)
        }
        
        do {
            try await client.getServiceRequest(TeamRankingsResponse.self, endpoint: "rankings/teams?season=2023")
                .sink(
                    receiveCompletion: { status in
                        switch status {
                            case .finished:
                                print("Ranking:loadTeams:finished")
                                break
                            case .failure(let error):
                                print("Ranking:loadTeams:Receiver error \(error)")
                                break
                        }
                    },
                    receiveValue: {[weak self] items in
                        print("Ranking:loadTeams:Data received")
                        guard let self = self else { return }
                        
                        let teamModels = items.response.map({ item in
                            convertDomainToUIModel(item: item)
                        })
                        
                        DispatchQueue.main.async {
                            self.teams = teamModels
                        }
                    }
                )
                .store(in: &cancellable)
        } catch {
            print(error)
            throw error
        }
    }

    func loadDrivers() async throws {
        
        do {
            try await client.getServiceRequest(DriverRankingsResponse.self, endpoint: "rankings/drivers?season=2023")
                .sink(
                    receiveCompletion: { status in
                        switch status {
                            case .finished:
                                print("Ranking:loadDrivers:finished")
                                break
                            case .failure(let error):
                                print("Ranking:loadDrivers:Receiver error \(error)")
                                break
                        }
                    },
                    receiveValue: {[weak self] items in
                        print("Ranking:loadDrivers:Data received")
                        guard let self = self else { return }
                        
                        let driverModels = items.response.map({
                            
                            DriverModel(id: $0.driver.id,
                                        rank: $0.position,
                                        points: $0.points,
                                        name: $0.driver.name,
                                        countryCode: nil,
                                        teamName: $0.team.name,
                                        driverNo: $0.driver.number,
                                        imageUrl: $0.driver.image)
                        })
                        
                        DispatchQueue.main.async {
                            self.drivers = driverModels
                        }
                    }
                )
                .store(in: &cancellable)
        } catch {
            print(error)
            throw error
        }
    }
    
}
