//
//  TeamsViewModel.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 25.08.2023.
//

import Foundation
import Combine

class TeamsViewModel: ObservableObject {
    
    private let service = ApiSportsService()
    
    @Published var models: [TeamModel] = []
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        loadData()
    }
    
    private func loadData() {
        
        service
            .teamRanking
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
                    
                    let uiModels = items.response.map({ item in
                        self.convertDomainToUIModel(item: item)
                    })
                    
                    DispatchQueue.main.async {
                        self.models = uiModels
                    }
                }
            )
            .store(in: &cancellable)
    }
    
    private func convertDomainToUIModel(item: TeamRankingItem) -> TeamModel {
        return TeamModel(position: item.position,
                         name: item.team.name,
                         points: item.points,
                         imageUrl: item.team.logo,
                         driver1Name: "Driver 1",
                         driver2Name: "Driver 2")
    }
}
