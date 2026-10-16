import Foundation

public struct GetTrafficAllocationLatestDto: Codable, Hashable, Sendable {
    /// The assistant whose latest allocation to return.
    public let assistantId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        assistantId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.assistantId = assistantId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assistantId = try container.decode(String.self, forKey: .assistantId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.assistantId, forKey: .assistantId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case assistantId
    }
}