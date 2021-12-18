//
//  StartAndAudioExtension.swift
//  Earth
//
//  Created by IgorGalimski on 18/12/2021.
//

import UIKit
import SceneKit
import AVKit

extension ViewController
{
    func StartBackgroundMusic()
    {
        guard let musicFile = Bundle.main.url(forResource: "backgroundMusic", withExtension: "mp3") else { return }
        
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: musicFile)
            audioPlayer?.volume = 0.2
            audioPlayer?.play()
            
        } catch let error
        {
            print(error)
        }
    }
    
    func AddStars()
    {
        guard let starFieldScene = SCNScene(named: "StarField.scn") else { return }
        guard let particleNode = starFieldScene.rootNode.childNode(withName: "particles", recursively: true) else { return }
        
        if scene != nil
        {
            scene?.rootNode.addParticleSystem(particleNode.particleSystems!.first!)
        }
    }
}
