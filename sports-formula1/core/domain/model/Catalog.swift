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
    
    private let client: ApiSportsServiceProtocol
    private var cancellable = Set<AnyCancellable>()
    
    @Published var races: [RaceSummaryModel] = .init() {
        didSet {
            if oldValue != races { objectWillChange.send() }
        }
    }
    
    @Published var circuits: [CircuitModel] = .init() {
        didSet {
            if oldValue != circuits { objectWillChange.send() }
        }
    }
    
    init(client: ApiSportsServiceProtocol) {
        self.client = client
    }
    
    func loadRaces() async throws {
        
        do {
            try await client.getRaces()
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
    
    func loadCircuits() async throws {
        
        do {
            try await client.getCircuits()
                .sink(
                    receiveCompletion: { status in
                        switch status {
                            case .finished:
                                print("Catalog:loadCircuits:finished")
                                break
                            case .failure(let error):
                                print("Catalog:loadCircuits:Receiver error \(error)")
                                break
                        }
                    },
                    receiveValue: {[weak self] items in
                        print("Catalog:loadCircuits:Data received")
                        guard let self = self else { return }
                        
                        let circuitModels = items.response.map({
                            
                            CircuitModel(
                                id: $0.id,
                                name: $0.name,
                                imageUrl:$0.image,
                                city: $0.competition.location?.city ?? "Unknown",
                                country: $0.competition.location?.country ?? "Unknown",
                                firstGrandPrixYear: $0.firstGrandPrix,
                                lapCount: $0.laps,
                                length: $0.length,
                                raceLength: $0.raceDistance,
                                lapRecord: CircuitModel.LapRecord(time: $0.lapRecord?.time ?? "Unknown",
                                                                  driverName: $0.lapRecord?.driver ?? "Unknown",
                                                                  year: $0.lapRecord?.year ?? "Unknown"))
                            
                        })
                        
                        DispatchQueue.main.async {
                            self.circuits = circuitModels
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
