import Foundation

public enum CartesiaExperimentalControlsEmotion: String, Codable, Hashable, CaseIterable, Sendable {
    case angerLowest = "anger:lowest"
    case angerLow = "anger:low"
    case angerHigh = "anger:high"
    case angerHighest = "anger:highest"
    case positivityLowest = "positivity:lowest"
    case positivityLow = "positivity:low"
    case positivityHigh = "positivity:high"
    case positivityHighest = "positivity:highest"
    case surpriseLowest = "surprise:lowest"
    case surpriseLow = "surprise:low"
    case surpriseHigh = "surprise:high"
    case surpriseHighest = "surprise:highest"
    case sadnessLowest = "sadness:lowest"
    case sadnessLow = "sadness:low"
    case sadnessHigh = "sadness:high"
    case sadnessHighest = "sadness:highest"
    case curiosityLowest = "curiosity:lowest"
    case curiosityLow = "curiosity:low"
    case curiosityHigh = "curiosity:high"
    case curiosityHighest = "curiosity:highest"
}