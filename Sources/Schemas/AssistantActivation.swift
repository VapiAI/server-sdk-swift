import Foundation

public struct AssistantActivation: Codable, Hashable, Sendable {
    /// This is the name of the assistant that was active during the call.
    public let assistantName: String
    /// This is the ID of the assistant that was active during the call.
    public let assistantId: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        assistantName: String,
        assistantId: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.assistantName = assistantName
        self.assistantId = assistantId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assistantName = try container.decode(String.self, forKey: .assistantName)
        self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.assistantName, forKey: .assistantName)
        try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case assistantName
        case assistantId
    }
}