//
//  AddItem.swift
//  Weather
//
//  Created by Harsh Chaturvedi on 24/06/21.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var controller: WeatherController
    @State private var cityName: String = ""
    var body: some View {
        NavigationView {
            Form {
                TextField("City Name", text: $cityName)
                
            }
            .navigationTitle("Add City")
            .toolbar {
                Button(action: {
                    controller.addCity(cityName)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "plus.circle")
                }
            }
        }
    }
}

