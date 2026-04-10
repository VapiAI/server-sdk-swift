import Foundation

public struct GenerateScenariosDto: Codable, Hashable, Sendable {
    /// ID of the assistant to generate scenarios for
    public let assistantId: String?
    /// ID of the squad to generate scenarios for
    public let squadId: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        assistantId: String? = nil,
        squadId: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.assistantId = assistantId
        self.squadId = squadId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
        self.squadId = try container.decodeIfPresent(String.self, forKey: .squadId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
        try container.encodeIfPresent(self.squadId, forKey: .squadId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case assistantId
        case squadId
    }
}