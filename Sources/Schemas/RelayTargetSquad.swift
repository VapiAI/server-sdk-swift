import Foundation

public struct RelayTargetSquad: Codable, Hashable, Sendable {
    /// The unique identifier of the squad
    public let squadId: String?
    /// The name of the squad
    public let squadName: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        squadId: String? = nil,
        squadName: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.squadId = squadId
        self.squadName = squadName
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.squadId = try container.decodeIfPresent(String.self, forKey: .squadId)
        self.squadName = try container.decodeIfPresent(String.self, forKey: .squadName)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.squadId, forKey: .squadId)
        try container.encodeIfPresent(self.squadName, forKey: .squadName)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case squadId
        case squadName
    }
}