import SwiftUI
import MapKit
import Alamofire

@main
struct MapApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.334_900, longitude: -122.009_020),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    let locations = [
        Location(name: "Apple Park", coordinate: CLLocationCoordinate2D(latitude: 37.334_900, longitude: -122.009_020)),
        Location(name: "Googleplex", coordinate: CLLocationCoordinate2D(latitude: 37.422, longitude: -122.084))
    ]
    
    @State private var networkStatus: String = "Waiting to fetch data..."

    var body: some View {
        ZStack(alignment: .bottom) {
            Map(coordinateRegion: $region, annotationItems: locations) { location in
                MapMarker(coordinate: location.coordinate, tint: .blue)
            }
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 12) {
                Text("Map Application")
                    .font(.headline)
                    .padding(.top)
                
                Text(networkStatus)
                    .font(.subheadline)
                    .foregroundColor(networkStatus.contains("Successful") ? .green : .gray)
                
                Button(action: {
                    fetchData()
                }) {
                    Text("Test Network Request with Alamofire")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding()
        }
        .onAppear {
            fetchData()
        }
    }
    
    func fetchData() {
        self.networkStatus = "Fetching data..."
        
        // Example usage of Alamofire to fetch IP info
        AF.request("https://httpbin.org/get").response { response in
            if response.error == nil {
                self.networkStatus = "Network Request Successful! (Alamofire)"
            } else {
                self.networkStatus = "Network Request Failed."
            }
        }
    }
}
