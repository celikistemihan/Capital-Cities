//
//  ViewController.swift
//  Project16
//
//  Created by İstemihan Çelik on 8.04.2021.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home for 2012 Olympics", wikiInfo: "London")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "It was foundend over a thousands years ago", wikiInfo: "Oslo")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called City of Light", wikiInfo: "Paris")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it ", wikiInfo: "Rome")
        let istanbul = Capital(title: "Istanbul", coordinate: CLLocationCoordinate2D(latitude: 41.015137, longitude: 28.979530), info: "Best city in the World", wikiInfo: "Istanbul")
        
        let capitalCities = [london, oslo, paris, rome, istanbul]
        
        mapView.addAnnotations(capitalCities)
        navigationItem.title = "Capital Cities"
        //Project:16 Challenge:2
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(changeMap))
        
    }
    
    //Project:16 Challenge:2
    @objc func changeMap(){
        let ac = UIAlertController(title: "Change MapView", message: "Which one do you prefer?", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Standard", style: .default, handler: { (_) in
            self.mapView.mapType = .standard
        }))
        ac.addAction(UIAlertAction(title: "Satellite", style: .default, handler: { (_) in
            self.mapView.mapType = .satellite
        }))
        present(ac, animated: true)
    }
    
    
    @objc func satellite(){
        mapView.mapType = .satellite
    }
    
    
    //MKPinAnnotationView is a built-in class that draws tappable pins on the map
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 1: If the annotation isn't from a capital city, it must return nil so iOS uses a default view
        guard annotation is Capital else { return nil }
        // 2:Define a reuse identifier. This is a string that will be used to ensure we reuse annotation views as much as possible.
        let identifier = "Capital"
        
       
        // 3:Try to dequeue an annotation view from the map view's pool of unused views.
        
        //Project: 16 Challenge:1, downcasting yaptık annotationView MKAnnotationView iken, MKPinAnnotationView yaptık gibi as? kullandıgımız için optional değer
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
     
        
        if annotationView == nil {
            //4: If it isn't able to find a reusable view, create a new one using MKPinAnnotationView and sets its canShowCallout property to true. This triggers the popup with the city name.
           
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            
            annotationView?.canShowCallout = true
            
            
            // 5:Create a new UIButton using the built-in .detailDisclosure type. This is a small blue "i" symbol with a circle around it.
            let button = UIButton(type: .detailDisclosure)
            //Handling the tap of an annotation view's button is best done using `calloutAccessoryControlTapped`.
            annotationView?.rightCalloutAccessoryView = button
        } else {
            // 6:If it can reuse a view, update that view to use a different annotation.
            annotationView?.annotation = annotation
            
        }
        //Project: 16 Challenge:1
        annotationView?.pinTintColor = .systemGreen
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else {return }
        
        //show new web view content wikipedia
        
        //let placeName = capital.title
        //let placeInfo = capital.info
        
        //Project:16 Challenge:3
        let vc = WikipediaControllerViewController()
        vc.capital = capital
        
        navigationController?.pushViewController(vc, animated: true)
        
       // let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        //ac.addAction(UIAlertAction(title: "OK", style: .default))
        //present(ac, animated: true)
    }

}

