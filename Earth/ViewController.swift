//
//  ViewController.swift
//  Earth
//
//  Created by Yasser Farahi.
//

import UIKit
import SceneKit
import AVKit

class ViewController: UIViewController, SCNCameraControllerDelegate
{
    var scene: SCNScene?
    var sceneView: SCNView?

    var audioPlayer: AVAudioPlayer?
    
    var sunAndLightPosition: (x: CGFloat, y: CGFloat, z: CGFloat) = (-20, .zero, .zero)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        SetupSceneView()
        SetupLight()
        SetupCamera()
    }
    
    func SetupSceneView()
    {
        sceneView = SCNView(frame: view.bounds)
        scene = SCNScene()
        
        sceneView?.scene = scene
        sceneView?.backgroundColor = .black
        
        view.addSubview(sceneView!)
        
        sceneView?.defaultCameraController.delegate = self
        sceneView?.allowsCameraControl = true
        sceneView?.cameraControlConfiguration.allowsTranslation = true
        sceneView?.cameraControlConfiguration.panSensitivity = 1.0
        sceneView?.defaultCameraController.interactionMode = .fly
    }
    
    func SetupLight()
    {
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(sunAndLightPosition.x, sunAndLightPosition.y, sunAndLightPosition.z)
        
        if scene != nil
        {
            scene?.rootNode.addChildNode(lightNode)
        }
    }
    
    func SetupCamera()
    {
        let cameraNode = SCNNode()
        cameraNode.name = "CameraNode"
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(30, .zero, 9)
        cameraNode.rotation = SCNVector4(.zero, 1, .zero, -3.14)
        if scene != nil
        {
            scene?.rootNode.addChildNode(cameraNode)
        }
    }
    
    func GeneratePlanet(nodeName: String, textureName: String?, isPlanet: Bool,
                        isEarth: Bool, hasRing: Bool, animatitionDuration: Double?,
                        radius: CGFloat, x: CGFloat, y: CGFloat, z: CGFloat)
    {
        let planetNode = SCNNode()
        planetNode.geometry = SCNSphere(radius: radius)
        planetNode.name = nodeName
        planetNode.position = SCNVector3(x, y, z)
        
        if isEarth
        {
            planetNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "day")
            planetNode.geometry?.firstMaterial?.normal.contents = UIImage(named: "normal")
            planetNode.geometry?.firstMaterial?.specular.contents = UIImage(named: "spec")
            planetNode.geometry?.firstMaterial?.specular.intensity = 0.8
            
            let emissionTexture = UIImage(named: "night")
            let nightMapForEmission = SCNMaterialProperty(contents: emissionTexture!)
            planetNode.geometry?.setValue(nightMapForEmission, forKey: "emissionTexture")
            planetNode.geometry?.shaderModifiers = [.fragment: shaderModifier]
        }
        else
        {
            guard let planetTexture = textureName else { return }
            
            planetNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: planetTexture)
        }
        
        if isPlanet
        {
            guard let duration = animatitionDuration else { return }
            let rotation = SCNAction.rotate(by: 360*CGFloat((CGFloat.pi) / 180),
                                        around: SCNVector3(.zero, 1, .zero),
                                        duration: duration)
            
            let repeatRotation = SCNAction.repeatForever(rotation)
            planetNode.runAction(repeatRotation)
        }
        else
        {
            guard let sunTexture = textureName else { return }
            planetNode.geometry?.firstMaterial?.selfIllumination.contents = UIImage(named: sunTexture)
            planetNode.geometry?.firstMaterial?.selfIllumination.intensity = 5.0
            planetNode.geometry?.firstMaterial?.emission.contents = UIImage(named: sunTexture)
            planetNode.geometry?.firstMaterial?.emission.intensity = 5.0
        }
        
        if hasRing
        {
            let ringNode = SCNNode()
            ringNode.geometry = SCNTube(innerRadius: 0.45, outerRadius: 0.6, height: 0.005)
            ringNode.position = planetNode.position
            ringNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "saturnRing")
            ringNode.rotation = planetNode.rotation
            
            if scene != nil
            {
                scene?.rootNode.addChildNode(ringNode)
            }
        }
        
        if scene != nil
        {
            scene?.rootNode.addChildNode(planetNode)
        }
    }
}

