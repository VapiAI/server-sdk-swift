import Foundation

/// Language for speech synthesis. Uses ISO 639 codes. Supported: en, es, de, fr, ar, hi, ja, he, pt, ta, si.
public enum FallbackRimeAiVoiceLanguage: String, Codable, Hashable, CaseIterable, Sendable {
    case en
    case es
    case de
    case fr
    case ar
    case hi
    case ja
    case he
    case pt
    case ta
    case si
}