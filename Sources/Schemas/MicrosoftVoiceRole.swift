import Foundation

/// Role-play (age/gender imitation). Requires `style` to be set; ignored otherwise.
public enum MicrosoftVoiceRole: String, Codable, Hashable, CaseIterable, Sendable {
    case girl = "Girl"
    case boy = "Boy"
    case youngAdultFemale = "YoungAdultFemale"
    case youngAdultMale = "YoungAdultMale"
    case olderAdultFemale = "OlderAdultFemale"
    case olderAdultMale = "OlderAdultMale"
    case seniorFemale = "SeniorFemale"
    case seniorMale = "SeniorMale"
}