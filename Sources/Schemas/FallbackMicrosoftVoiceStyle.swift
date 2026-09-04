import Foundation

/// Speaking style applied via mstts:express-as on every request. Unknown styles are ignored by Azure and fall back to neutral.
public enum FallbackMicrosoftVoiceStyle: String, Codable, Hashable, CaseIterable, Sendable {
    case adventurous
    case angry
    case caring
    case cheerful
    case confused
    case curious
    case determined
    case disappointed
    case disgusted
    case embarrassed
    case empathy
    case encouraging
    case excited
    case fearful
    case friendly
    case happy
    case hopeful
    case jealous
    case joyful
    case nostalgic
    case reflective
    case regretful
    case relieved
    case sad
    case serious
    case shouting
    case softvoice
    case surprised
    case whispering
}