import Foundation

public struct SyncVoiceLibraryDto: Codable, Hashable, Sendable {
    /// List of providers you want to sync.
    public let providers: [SyncVoiceLibraryDtoProvidersItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        providers: [SyncVoiceLibraryDtoProvidersItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.providers = providers
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.providers = try container.decodeIfPresent([SyncVoiceLibraryDtoProvidersItem].self, forKey: .providers)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.providers, forKey: .providers)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case providers
    }
}