import Foundation

public struct ResponseOutputMessage: Codable, Hashable, Sendable {
    /// The unique ID of the output message
    public let id: String
    /// Content of the output message
    public let content: [ResponseOutputText]
    /// The role of the output message
    public let role: ResponseOutputMessageRole
    /// The status of the message
    public let status: ResponseOutputMessageStatus
    /// The type of the output message
    public let type: ResponseOutputMessageType
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        content: [ResponseOutputText],
        role: ResponseOutputMessageRole,
        status: ResponseOutputMessageStatus,
        type: ResponseOutputMessageType,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.content = content
        self.role = role
        self.status = status
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.content = try container.decode([ResponseOutputText].self, forKey: .content)
        self.role = try container.decode(ResponseOutputMessageRole.self, forKey: .role)
        self.status = try container.decode(ResponseOutputMessageStatus.self, forKey: .status)
        self.type = try container.decode(ResponseOutputMessageType.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.content, forKey: .content)
        try container.encode(self.role, forKey: .role)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case content
        case role
        case status
        case type
    }
}