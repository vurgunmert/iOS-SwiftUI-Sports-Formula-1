//
//  FormulaRepository.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 25.08.2023.
//

import Foundation

class FormulaRepository {
    
    private let baseUrl = URL(string: "https://v1.formula-1.api-sports.io/")!
    private let authHeaderKey = "x-rapidapi-key"
    private let authHeaderValue = "b049b3527733bfbf098106fc59b5523d"
    private let jsonHeaderKey = "Content-Type"
    private let jsonHeaderValue = "application/json"
    
    func getDrivers(onResponse: @escaping ([DriverRankingItem]) -> Void) {
        
        let url = URL(string: "https://v1.formula-1.api-sports.io/rankings/drivers?season=2023")!
        //TODO: Combine rankings with drivers api

        var request = URLRequest(url: url)
                
        request.setValue("b049b3527733bfbf098106fc59b5523d", forHTTPHeaderField: "x-rapidapi-key")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {

                do {
                    let rankingResponse = try JSONDecoder().decode(DriverRankingsResponse.self, from: data)
                    
                    onResponse(rankingResponse.response)
                    
                } catch(let error) {
                    print(error)
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
            
        }
        
        task.resume()
    }
    
    
    func getTeams(onResponse: @escaping ([TeamRankingItem]) -> Void) {
        
        let url = URL(string: "https://v1.formula-1.api-sports.io/rankings/teams?season=2023")!
        //TODO: Combine rankings with teams api
        
        var request = URLRequest(url: url)
        
        request.setValue("b049b3527733bfbf098106fc59b5523d", forHTTPHeaderField: "x-rapidapi-key")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {
                do {
                    let rankingResponse = try JSONDecoder().decode(TeamRankingsResponse.self, from: data)
                    
                    onResponse(rankingResponse.response)
                    
                } catch(let error) {
                    print(error)
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
            
        }
        
        task.resume()
    }
    
    
    func getRaces(onResponse: @escaping ([RacesResponseItem]) -> Void) {
        
        let url = URL(string: "https://v1.formula-1.api-sports.io/races?season=2023&type=race")!
        
        var request = URLRequest(url: url)
        
        request.setValue("b049b3527733bfbf098106fc59b5523d", forHTTPHeaderField: "x-rapidapi-key")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
        
            if let data = data {
                print(String(data: data, encoding: .utf8)!)
                
                do {
                    let rankingResponse = try JSONDecoder().decode(RacesResponse.self, from: data)
                    
                    onResponse(rankingResponse.response)
                    
                } catch(let error) {
                    print(error)
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
            
        }
        
        task.resume()
    }
    
    func getCircuits(onResponse: @escaping ([CircuitsResponseItem]) -> Void) {
        
        let url = URL(string: "https://v1.formula-1.api-sports.io/circuits")!
        
        var request = URLRequest(url: url)
        
        request.setValue("b049b3527733bfbf098106fc59b5523d", forHTTPHeaderField: "x-rapidapi-key")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            
            if let data = data {
                print(String(data: data, encoding: .utf8)!)
                
                do {
                    let rankingResponse = try JSONDecoder().decode(CircuitsResponse.self, from: data)
                    
                    onResponse(rankingResponse.response)
                    
                } catch(let error) {
                    print(error)
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
            
        }
        
        task.resume()
    }
    
    
}
