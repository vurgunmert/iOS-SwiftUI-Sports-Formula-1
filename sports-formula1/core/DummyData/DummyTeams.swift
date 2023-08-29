//
//  DummyTeams.swift
//  sports-formula1
//
//  Created by Vurgun on 28.08.2023.
//

import SwiftUI

var redbullCard = TeamCardModel.init(name: "Red Bull Racing",
                                     imageUrl: "https://media-3.api-sports.io/formula-1/teams/1.png",
                                     mainColor: .blue,
                                     position: 1,
                                     points: 540,
                                     driver1: perezCard,
                                     driver2: maxCard)


var merdecesCard = TeamCardModel.init(name: "Mercedes",
                                      imageUrl: "https://media-3.api-sports.io/formula-1/teams/5.png",
                                      mainColor: .teal,
                                      position: 2,
                                      points: 255,
                                      driver1: lewisCard,
                                      driver2: russelCard)


var astonCard = TeamCardModel.init(name: "Aston Martin",
                                   imageUrl: "https://media-3.api-sports.io/formula-1/teams/17.png",
                                   mainColor: .green,
                                   position: 3,
                                   points: 215,
                                   driver1: alonzoCard,
                                   driver2: strollCard)


var ferrariCard = TeamCardModel.init(name: "Ferrari",
                                     imageUrl: "https://media-3.api-sports.io/formula-1/teams/3.png",
                                     mainColor: .red,
                                     position: 4,
                                     points: 201,
                                     driver1: sainzCard,
                                     driver2: leclercCard)


var mclarenCard = TeamCardModel.init(name: "McLaren",
                                     imageUrl: "https://media-3.api-sports.io/formula-1/teams/2.png",
                                     mainColor: .orange,
                                     position: 5,
                                     points: 111,
                                     driver1: landoCard,
                                     driver2: landoCard)


var alpineCard = TeamCardModel.init(name: "Alpine",
                                     imageUrl: "https://media-3.api-sports.io/formula-1/teams/13.png",
                                     mainColor: .cyan,
                                     position: 4,
                                     points: 73,
                                     driver1: oconCard,
                                     driver2: gaslyCard)


var williamsCard = TeamCardModel.init(name: "Williams",
                                     imageUrl: "https://media-3.api-sports.io/formula-1/teams/12.png",
                                     mainColor: .red,
                                     position: 4,
                                     points: 15,
                                     driver1: sainzCard,
                                     driver2: leclercCard)

var haasCard = TeamCardModel.init(name: "Haas",
                                     imageUrl: "https://media-3.api-sports.io/formula-1/teams/14.png",
                                     mainColor: .red,
                                     position: 4,
                                     points: 11,
                                     driver1: sainzCard,
                                     driver2: leclercCard)

var dummyTeamCards = [redbullCard, merdecesCard, astonCard, ferrariCard, mclarenCard, alpineCard, williamsCard, haasCard]
