//
//  TeamRankingsResponse.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 25.08.2023.
//

import Foundation

struct TeamRankingsResponse: Codable {
    
    var errors     : [String]
    var results    : Int
    var response   : [TeamRankingItem]
    
    enum CodingKeys: String, CodingKey {
        case errors     = "errors"
        case results    = "results"
        case response   = "response"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        errors     = try values.decodeIfPresent([String].self, forKey: .errors) ?? []
        results    = try values.decodeIfPresent(Int.self, forKey: .results) ?? 0
        response   = try values.decodeIfPresent([TeamRankingItem].self , forKey: .response) ?? []
    }
    
    init(items: [TeamRankingItem]) {
        self.errors = []
        self.results = items.count
        self.response = items
    }
}

struct TeamRankingItem: Codable {
    
    var position : Int
    var team     : TeamDto
    var points   : Int
    
    enum CodingKeys: String, CodingKey {
        
        case position = "position"
        case team     = "team"
        case points   = "points"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        position = try values.decode(Int.self    , forKey: .position )
        team     = try values.decode(TeamDto.self   , forKey: .team     )
        points   = try values.decodeIfPresent(Int.self    , forKey: .points   ) ?? 0
    }
    
    init(position: Int, team: TeamDto, points: Int) {
        self.position = position
        self.team = team
        self.points = points
    }
}
