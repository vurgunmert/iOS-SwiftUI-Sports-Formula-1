//
//  Ranking.swift
//  sports-formula1
//
//  Created by user on 26.08.2023.
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
                                print("Publisher:getTeamRanking:Completed")
                                break
                            case .failure(let error):
                                print("Publisher:getTeamRanking:Receiver error \(error)")
                                break
                        }
                    },
                    receiveValue: {[weak self] items in
                        print("Publisher:getTeamRanking:Data received")
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
    
}
