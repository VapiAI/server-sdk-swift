import Foundation

/// This is the language that will be used. This is optional and will default to the correct language for the voiceId.
public enum FallbackCartesiaVoiceLanguage: String, Codable, Hashable, CaseIterable, Sendable {
    case en
    case de
    case es
    case fr
    case ja
    case pt
    case zh
    case hi
    case it
    case ko
    case nl
    case pl
    case ru
    case sv
    case tr
}