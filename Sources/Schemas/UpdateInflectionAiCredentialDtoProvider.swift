import Foundation

/// This is the api key for Pi in InflectionAI's console. Get it from here: https://developers.inflection.ai/keys, billing will need to be setup
public enum UpdateInflectionAiCredentialDtoProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case inflectionAi = "inflection-ai"
}