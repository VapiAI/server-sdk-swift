import Foundation

public enum FallbackGladiaTranscriberLanguageBehaviour: String, Codable, Hashable, CaseIterable, Sendable {
    case manual
    case automaticSingleLanguage = "automatic single language"
    case automaticMultipleLanguages = "automatic multiple languages"
}