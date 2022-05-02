//
//  RatingCupsView.swift
//  CoffeeShop
//
//  Created by aung zay on 30/04/2022.
//

import SwiftUI

struct RatingCupsView: View {
    var rating : Double
    var body: some View {
        if(rating > 0 && rating <= 2){
            Image(systemName: "cup.and.saucer.fill")
                .foregroundColor(Color(Assets.mainColor))
        }
        
        if(rating > 2 && rating <= 4){
            HStack{
                Image(systemName: "cup.and.saucer.fill")
                Image(systemName: "cup.and.saucer.fill")
            }
            .foregroundColor(Color(Assets.mainColor))
            
        }
        if(rating > 4 && rating <= 6){
            HStack{
                Image(systemName: "cup.and.saucer.fill")
                Image(systemName: "cup.and.saucer.fill")
                Image(systemName: "cup.and.saucer.fill")
            }
            .foregroundColor(Color(Assets.mainColor))
            
        }
        if(rating > 6 && rating <= 8){
            HStack{
                Image(systemName: "cup.and.saucer.fill")
                Image(systemName: "cup.and.saucer.fill")
                Image(systemName: "cup.and.saucer.fill")
                Image(systemName: "cup.and.saucer.fill")
            }
            .foregroundColor(Color(Assets.mainColor))
            
        }
        if(rating > 8){
            HStack{
                Image(systemName: "cup.and.saucer.fill")
                Image(systemName: "cup.and.saucer.fill")
                Image(systemName: "cup.and.saucer.fill")
                Image(systemName: "cup.and.saucer.fill")
                Image(systemName: "cup.and.saucer.fill")
            }
            .foregroundColor(Color(Assets.mainColor))
            
        }
    }
}

struct RatingCupsView_Previews: PreviewProvider {
    static var previews: some View {
        RatingCupsView(rating: 4.5)
    }
}
