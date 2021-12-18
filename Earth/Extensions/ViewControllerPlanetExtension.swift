//
//  ViewControllerPlanetExtension.swift
//  Earth
//
//  Created by IgorGalimski on 18/12/2021.
//

import UIKit
import SceneKit

extension ViewController
{
    func SetupAllPlanets()
    {
        
        GeneratePlanet(nodeName: "Sun", textureName: "sun", isPlanet: false, isEarth: false, hasRing: false, animationDuration: nil, radius: 5.0, x: sunAndLightPosition.x, y: sunAndLightPosition.y, z: sunAndLightPosition.z)
        
        
        GeneratePlanet(nodeName: "Mercury", textureName: "mercury", isPlanet: true, isEarth: false, hasRing: false, animationDuration: 100, radius: 0.05, x: 3, y: .zero, z: -3)
        
        GeneratePlanet(nodeName: "Venus", textureName: "venus", isPlanet: true, isEarth: false, hasRing: false, animationDuration: 100, radius: 0.07, x: 5, y: .zero, z: 3)
        
        GeneratePlanet(nodeName: "Earth", textureName: nil, isPlanet: true, isEarth: true, hasRing: false, animationDuration: 100, radius: 0.4, x: 8, y: .zero, z: 6)
        
        GeneratePlanet(nodeName: "Cloud", textureName: "cloudMap", isPlanet: true, isEarth: false, hasRing: false, animationDuration: 130, radius: 0.41, x: 8, y: .zero, z: 6)
        
        GeneratePlanet(nodeName: "Moon", textureName: "moon", isPlanet: true, isEarth: false, hasRing: false, animationDuration: 1000, radius: 0.1, x: 7.8, y: 0.7, z: 6.7)
        
        GeneratePlanet(nodeName: "Mars", textureName: "mars", isPlanet: true, isEarth: false, hasRing: false, animationDuration: 150, radius: 0.15, x: 10, y: .zero, z: 8)
        
        GeneratePlanet(nodeName: "Jupiter", textureName: "jupiter", isPlanet: true, isEarth: false, hasRing: false, animationDuration: 100, radius: 0.9, x: .zero, y: .zero, z: -8)
        
        GeneratePlanet(nodeName: "Saturn", textureName: "saturn", isPlanet: true, isEarth: false, hasRing: true, animationDuration: 70, radius: 0.5, x: 5, y: .zero, z: -10)
        
        GeneratePlanet(nodeName: "Uranus", textureName: "uranus", isPlanet: true, isEarth: false, hasRing: false, animationDuration: 80, radius: 0.2, x: -16, y: .zero, z: 12)
        
        GeneratePlanet(nodeName: "Neptune", textureName: "neptune", isPlanet: true, isEarth: false, hasRing: false, animationDuration: 20, radius: 0.03, x: 2, y: .zero, z: 14)
        
        GeneratePlanet(nodeName: "Pluto", textureName: "pluto", isPlanet: true, isEarth: false, hasRing: false, animationDuration: 20, radius: 0.01, x: -18, y: .zero, z: -16)
        
        shouldCorrectCameraPosition()
    }
    
    func shouldCorrectCameraPosition()
    {
        let cameraNode = scene?.rootNode.childNode(withName: "CameraNode", recursively: true)
        
        let targetNode = scene?.rootNode.childNode(withName: "Earth", recursively: true)
        
        cameraNode?.position = SCNVector3(targetNode!.position.x, targetNode!.position.y, targetNode!.position.z - 2)
    }
}
