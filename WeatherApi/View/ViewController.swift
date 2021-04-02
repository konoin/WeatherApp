//
//  ViewController.swift
//  WeatherApi
//
//  Created by Mikita Palyka on 1.04.21.
//

import UIKit

class ViewController: UIViewController {
    
    var networkWeatherManager = NetworkWeatherManager()
    
    let weatherIconImageView: UIImageView = {
        let weatherImageView = UIImageView()
        weatherImageView.translatesAutoresizingMaskIntoConstraints = false
        weatherImageView.image = UIImage(systemName: "cloud.rain.fill")
        return weatherImageView
    }()
    
    let cityLabel: UILabel = {
        let cityLabel = UILabel()
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.font = .monospacedSystemFont(ofSize: 20, weight: .heavy)
        cityLabel.text = "Minsk"
        cityLabel.textAlignment = .center
        return cityLabel
    }()
    
    let temperatureLabel: UILabel = {
        let tempertureLabel = UILabel()
        tempertureLabel.translatesAutoresizingMaskIntoConstraints = false
        tempertureLabel.text = "123"
        tempertureLabel.textAlignment = .center
        tempertureLabel.font = .monospacedSystemFont(ofSize: 20, weight: .heavy)
        return tempertureLabel
    }()
    
    let feelsLikeTemperatureLabel: UILabel = {
        let feelsLikeTemperatureLabel = UILabel()
        feelsLikeTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        feelsLikeTemperatureLabel.text = "123"
        feelsLikeTemperatureLabel.textAlignment = .center
        feelsLikeTemperatureLabel.font = .monospacedSystemFont(ofSize: 20, weight: .heavy)
        return feelsLikeTemperatureLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        networkWeatherManager.onCompliteon = { currentWeather in
            
        }
        networkWeatherManager.fetchCurrentWeather(forCity: "London")
        
        setConstraints()
        
    }
    
    let searchButton: UIButton = {
        let searchButton = UIButton()
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.setImage(UIImage(named: "search"), for: .normal)
        searchButton.addTarget(self, action: #selector(searchPresed(_:)), for: .touchUpInside)
        return searchButton
    }()
    
    @objc func searchPresed(_ sender: UIButton) {
        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { city in
            self.networkWeatherManager.fetchCurrentWeather(forCity: city)
        }
    }
    
    func setConstraints() {
        view.addSubview(weatherIconImageView)
        view.addSubview(cityLabel)
        view.addSubview(temperatureLabel)
        view.addSubview(feelsLikeTemperatureLabel)
        view.addSubview(searchButton)
        
        
        NSLayoutConstraint.activate([
            weatherIconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherIconImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            weatherIconImageView.widthAnchor.constraint(equalToConstant: 200),
            weatherIconImageView.heightAnchor.constraint(equalToConstant: 200),
            
            cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityLabel.topAnchor.constraint(equalTo: weatherIconImageView.bottomAnchor, constant: 16),
            cityLabel.widthAnchor.constraint(equalToConstant: 300),
            cityLabel.heightAnchor.constraint(equalToConstant: 100),
            
            temperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            temperatureLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 16),
            temperatureLabel.widthAnchor.constraint(equalToConstant: 300),
            temperatureLabel.heightAnchor.constraint(equalToConstant: 100),
            
            feelsLikeTemperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            feelsLikeTemperatureLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 16),
            feelsLikeTemperatureLabel.widthAnchor.constraint(equalToConstant: 300),
            feelsLikeTemperatureLabel.heightAnchor.constraint(equalToConstant: 100),
            
            searchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchButton.heightAnchor.constraint(equalToConstant: 25),
            searchButton.widthAnchor.constraint(equalToConstant: 25)
        ])
    }
}


