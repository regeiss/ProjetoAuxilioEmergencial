//
//  LocalizacaoAtualScreen.swift
//  ProjetoAuxilioEmergencial
//
//  Created by Roberto Edgar Geiss on 22/01/25.
//

import SwiftUI
import MapKit
import CoreLocation

struct LocalizacaoAtualScreen: View {

  @State var region = MKCoordinateRegion(
    center: .init(latitude: 37.334_900, longitude: -122.009_020),
    span: .init(latitudeDelta: 0.2, longitudeDelta: 0.2)
  )
  let locationManager = CLLocationManager()

  var body: some View {
    Map(
      coordinateRegion: $region,
      showsUserLocation: true,
      userTrackingMode: .constant(.follow)
    )
    .edgesIgnoringSafeArea(.all)
    .onAppear {
      locationManager.requestWhenInUseAuthorization()
    }
  }
}
