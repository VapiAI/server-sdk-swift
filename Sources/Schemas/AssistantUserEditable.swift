import Foundation

public struct AssistantUserEditable: Codable, Hashable, Sendable {
    public let serverMessages: JSONValue?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        serverMessages: JSONValue? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.serverMessages = serverMessages
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.serverMessages = try container.decodeIfPresent(JSONValue.self, forKey: .serverMessages)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.serverMessages, forKey: .serverMessages)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case serverMessages
    }
}