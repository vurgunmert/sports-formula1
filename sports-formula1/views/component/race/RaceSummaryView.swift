//
//  RaceScheduleView.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 23.08.2023.
//

import SwiftUI
import Kingfisher

struct RaceSummaryView: View {
    
    let model: RaceSummaryModel
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            HStack {
                if let date = dateFrom(date: model.dateTime) {
                    Text(date, format: Date.FormatStyle().month().day())
                        .font(.system(size: 30, weight: .semibold, design: .serif))
                } else {
                    Text("N/A")
                        .font(.system(size: 30, weight: .semibold, design: .serif))
                }
                
                Spacer()
                
                Text(model.country)
                    .font(.system(size: 25, weight: .bold, design: .serif))
            }
            
            Divider()
            
            Text(model.circuitName)
                .font(.system(size: 20, weight: .bold, design: .serif))
            
            
            if let drivers = model.drivers {
                Divider()
                
                HStack(alignment: .bottom) {
                    
                    VStack {
                        
                        ZStack(alignment: .bottom) {
                            Rectangle()
                                .fill(
                                    LinearGradient(gradient: Gradient(colors: [.white, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                )
                                .frame(width: 110, height: 70)
                                .cornerRadius(20, corners: .topLeft)
                                .cornerRadius(20, corners: .topRight)
                            
                            KFImage(URL(string: drivers[1].imageUrl))
                                .resizable()
                                .frame(width: 110, height: 110)
                        }
                        
                        Text(drivers[1].abbr).font(.headline).bold().italic()
                    }
                    
                    VStack {
                        
                        ZStack(alignment: .bottom) {
                            Rectangle()
                                .fill(
                                    LinearGradient(gradient: Gradient(colors: [.white, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                )
                                .frame(width: 120, height: 80)
                                .cornerRadius(20, corners: .topLeft)
                                .cornerRadius(20, corners: .topRight)
                            
                            KFImage(URL(string: drivers[0].imageUrl))
                                .resizable()
                                .frame(width: 120, height: 120)
                        }
                        
                        Text(drivers[0].abbr).font(.headline).bold().italic()
                    }
                    
                    VStack {
                        
                        ZStack(alignment: .bottom) {
                            Rectangle()
                                .fill(
                                    LinearGradient(gradient: Gradient(colors: [.white, .yellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                )
                                .frame(width: 100, height: 60)
                                .cornerRadius(20, corners: .topLeft)
                                .cornerRadius(20, corners: .topRight)
                            
                            KFImage(URL(string: drivers[2].imageUrl))
                                .resizable()
                                .frame(width: 100, height: 100)
                        }
                        
                        Text(drivers[2].abbr).font(.headline).bold().italic()
                    }
                }
            }
            
           
        }
        .padding(15)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.red, lineWidth: 4)
        )
        .padding(15)
    }
    
    let releaseDate = Date()
}

struct RaceScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        RaceSummaryView(model: RaceSummaryModel(name: "Belgium Grand Prix",
                                                country: "Belgium",
                                                circuitName: "Circuit de Spa-Francorchamps",
                                                dateTime: "2023-07-30T13:00:00+00:00",
                                                drivers: [
                                                    RaceSummaryModel.Driver(position: 1,
                                                                            abbr: "VER",
                                                                            imageUrl:  "https://media-1.api-sports.io/formula-1/drivers/25.png",
                                                                            time: "1:27:57.940"),
                                                    RaceSummaryModel.Driver(position: 2,
                                                                            abbr: "PER",
                                                                            imageUrl:  "https://media-1.api-sports.io/formula-1/drivers/25.png",
                                                                            time: "1:27:57.940"),
                                                    RaceSummaryModel.Driver(position: 3,
                                                                            abbr: "ALO",
                                                                            imageUrl:  "https://media-1.api-sports.io/formula-1/drivers/25.png",
                                                                            time: "1:27:57.940")
                                                    
                                                ]))
    }
}
