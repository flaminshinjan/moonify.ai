import Foundation
import CoreLocation

class MoonViewModel: NSObject, ObservableObject {
    @Published var moonData: MoonData?
    @Published var sunSign: String = ""
    @Published var errorMessage: String?

    private let locationManager = CLLocationManager()

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func fetchCurrentLocation() {
        locationManager.requestLocation()
    }

    func fetchMoonData(lat: Double, lon: Double) {
        APIManager.shared.fetchMoonData(lat: lat, lon: lon) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.moonData = data.moon
                    self?.sunSign = data.moon.zodiac.sun_sign
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}

extension MoonViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        fetchMoonData(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        errorMessage = error.localizedDescription
    }
}
