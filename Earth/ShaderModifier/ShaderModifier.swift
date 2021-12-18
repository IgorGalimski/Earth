//
//  ShaderModifier.swift
//  Earth
//
//  Created by Yasser Farahi on.
//

import Foundation

let shaderModifier =
    """
    uniform sampler2D emissionTexture;
    vec3 light = _lightingContribution.diffuse;
    float lum = max(0.0, 1 - (1.0*light.r + 1.0*light.g + 1.0*light.b));
    vec4 emission = texture2D(emissionTexture, _surface.diffuseTexcoord) * lum;
    _output.color += emission;
    """
