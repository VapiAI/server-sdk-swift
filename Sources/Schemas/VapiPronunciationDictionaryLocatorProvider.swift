import Foundation

/// Provider that hosts this pronunciation dictionary
public enum VapiPronunciationDictionaryLocatorProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case cartesia
    case elevenLabs = "11labs"
}