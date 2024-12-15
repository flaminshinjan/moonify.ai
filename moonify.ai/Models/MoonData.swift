//
//  MoonData.swift
//  moonify.ai
//
//  Created by Shinjan Patra on 15/12/24.
//

import Foundation

struct MoonResponse: Codable {
    let timestamp: Int
    let datestamp: String
    let sun: SunData
    let moon: MoonData
}

struct SunData: Codable {
    let sunrise: Int
    let sunset: Int
    let solar_noon: String
    let day_length: String
}

struct MoonData: Codable {
    let phase_name: String
    let illumination: String
    let emoji: String
    let moonrise: String
    let moonset: String
    let zodiac: ZodiacData
}

struct ZodiacData: Codable {
    let sun_sign: String
    let moon_sign: String
}
