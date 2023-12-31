//
//  DriverView.swift
//  sports-formula1
//
//  Created by Mert Vurgun on 23.08.2023.
//

import SwiftUI
import Kingfisher

struct DriverView: View {
    
    let model: DriverModel
    
    var body: some View {
        
        
        VStack(alignment: .center) {
            
            HStack(alignment: .top) {
                
                VStack(alignment: .leading) {
                    Text(String(model.rank))
                        .foregroundColor(.black)
                        .bold()
                        .font(.system(size: 40, weight: .heavy))
                    
                    Text(model.name)
                        .font(.system(size: 24, weight: .medium))
                        .italic()
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Spacer()
                VStack{
                    Text(String(model.points))
                        .bold()
                        .font(.system(size: 30, weight: .heavy))
                    Text("PTS")
                        .foregroundColor(.gray)
                        .font(.system(size: 20, weight: .medium))
                }
            }
            
            if model.countryCode != nil {
                
                Divider()
                
                HStack {
                    Text(model.name)
                    Spacer()
                    Text(flag(from: model.countryCode!))
                }
            }
            
            Text(model.teamName)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 20, weight: .light))
            
            HStack(alignment: .bottom) {
                Text(String(model.driverNo))
                    .foregroundColor(.red)
                    .bold()
                    .font(.system(size: 60, weight: .heavy))
                KFImage.url(URL(string: model.imageUrl))
            }
            
        }
        .padding(10)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.gray, lineWidth: 1)
        )
        .shadow(radius: 10)
    }
}

struct DriverView_Previews: PreviewProvider {
    
    static var previews: some View {
        DriverView(model: DriverModel(id: 1,
                                      rank: 1,
                                      points: 314,
                                      name: "Max Verstappen",
                                      countryCode: "NL",
                                      teamName: "Red Bull Racing",
                                      driverNo: 1,
                                      imageUrl: "https://media-3.api-sports.io/formula-1/drivers/25.png"))
    }
}
