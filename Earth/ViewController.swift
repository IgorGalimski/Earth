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
            
        }
        else
        {
            guard let planetTexture = textureName else { return }
        }
    }
}

