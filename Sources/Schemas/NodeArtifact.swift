import Foundation

public struct NodeArtifact: Codable, Hashable, Sendable {
    /// These are the messages that were spoken during the node.
    public let messages: [NodeArtifactMessagesItem]?
    /// This is the node name.
    public let nodeName: String?
    /// These are the variable values that were extracted from the node.
    public let variableValues: [String: JSONValue]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        messages: [NodeArtifactMessagesItem]? = nil,
        nodeName: String? = nil,
        variableValues: [String: JSONValue]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.messages = messages
        self.nodeName = nodeName
        self.variableValues = variableValues
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.messages = try container.decodeIfPresent([NodeArtifactMessagesItem].self, forKey: .messages)
        self.nodeName = try container.decodeIfPresent(String.self, forKey: .nodeName)
        self.variableValues = try container.decodeIfPresent([String: JSONValue].self, forKey: .variableValues)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.messages, forKey: .messages)
        try container.encodeIfPresent(self.nodeName, forKey: .nodeName)
        try container.encodeIfPresent(self.variableValues, forKey: .variableValues)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case messages
        case nodeName
        case variableValues
    }
}