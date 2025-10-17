import Foundation

/// An emotion to be applied to the speech.
public enum FallbackPlayHtVoiceEmotion: String, Codable, Hashable, CaseIterable, Sendable {
    case femaleHappy = "female_happy"
    case femaleSad = "female_sad"
    case femaleAngry = "female_angry"
    case femaleFearful = "female_fearful"
    case femaleDisgust = "female_disgust"
    case femaleSurprised = "female_surprised"
    case maleHappy = "male_happy"
    case maleSad = "male_sad"
    case maleAngry = "male_angry"
    case maleFearful = "male_fearful"
    case maleDisgust = "male_disgust"
    case maleSurprised = "male_surprised"
}