//
//  Catalog.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 26.08.2023.
//

import Foundation
import Combine

@MainActor
class Catalog: ObservableObject  {
    
    private let client: ApiSportsHttpClient
    private var cancellable = Set<AnyCancellable>()
    
    @Published var races: [RaceSummaryModel] = .init() {
        didSet {
            if oldValue != races { objectWillChange.send() }
        }
    }
    
    init(client: ApiSportsHttpClient) {
        self.client = client
    }
    
    func loadRaces() async throws {
        
        do {
            try await client.getServiceRequest(RacesResponse.self, endpoint: "races?season=2023&type=race")
                .sink(
                    receiveCompletion: { status in
                        switch status {
                            case .finished:
                                print("Catalog:loadRaces:finished")
                                break
                            case .failure(let error):
                                print("Catalog:loadRaces:Receiver error \(error)")
                                break
                        }
                    },
                    receiveValue: {[weak self] items in
                        print("Catalog:loadRaces:Data received")
                        guard let self = self else { return }
                        
                        let raceModels = items.response.map({
                            
                            RaceSummaryModel(
                                id: $0.id,
                                name: $0.competition?.name ?? "Unknown",
                                country: $0.competition?.location?.country ?? "Unknown",
                                circuitName:  $0.circuit?.name ?? "Unknown",
                                dateTime: $0.date != nil ? dateFrom(date: $0.date!) : nil,
                                drivers: [])
                        })
                        
                        DispatchQueue.main.async {
                            self.races = raceModels
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
