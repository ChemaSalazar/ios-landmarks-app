//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Chema Salazar on 6/6/21.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly = false
    
    
    var filteredLandmarks: [Landmark] {
        landmarks.filter{ Landmark in
            (!showFavoritesOnly || Landmark.isFavorite)
            
        }
    }
    
    
    
    var body: some View {
        NavigationView{
            List {
                
                //Adding a toggle to pass the binding value of isFavorite state.
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                
                ForEach(filteredLandmarks) {Landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: Landmark)) {
                        LandmarkRow(landmark: Landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max", "iPad Pro (12.9-inch) (2nd generation)"], id: \.self) { deviceName in

            LandmarkList()

                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        
    }
}
