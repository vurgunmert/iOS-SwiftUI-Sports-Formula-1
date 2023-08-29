//
//  Navigator.swift
//  sports-formula1
//
//  Created by Vurgun on 29.08.2023.
//

import Foundation
import SwiftUI


class Navigator: ObservableObject {
    
    @Published var path = [ScreenRoute]()
    
    func addRoute(_ route: ScreenRoute, clearStack: Bool = false) {
        if clearStack {
            path = [ScreenRoute]()
        }
        path.append(route)
        self.objectWillChange.send()
    }
}

enum ScreenRoute: Hashable {
    case newsDetail(NewsPost)
    case driverDetail(DriverCardModel, TeamCardModel)
    case teamDetail(TeamCardModel)
    case raceDetail(RaceCardModel)
}
