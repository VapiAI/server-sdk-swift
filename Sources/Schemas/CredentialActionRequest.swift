import Foundation

public struct CredentialActionRequest: Codable, Hashable, Sendable {
    public let actionName: String
    public let input: [String: JSONValue]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        actionName: String,
        input: [String: JSONValue],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.actionName = actionName
        self.input = input
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.actionName = try container.decode(String.self, forKey: .actionName)
        self.input = try container.decode([String: JSONValue].self, forKey: .input)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.actionName, forKey: .actionName)
        try container.encode(self.input, forKey: .input)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case actionName = "action_name"
        case input
    }
}