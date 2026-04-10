import Foundation

/// This is the provider that manages this resource.
public enum ProviderResourceProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case cartesia
    case elevenLabs = "11labs"
}