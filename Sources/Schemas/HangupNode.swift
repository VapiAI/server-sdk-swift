import Foundation

public struct HangupNode: Codable, Hashable, Sendable {
    public let type: Hangup
    public let name: String
    /// This is whether or not the node is the start of the workflow.
    public let isStart: Bool?
    /// This is for metadata you want to store on the task.
    public let metadata: [String: JSONValue]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: Hangup,
        name: String,
        isStart: Bool? = nil,
        metadata: [String: JSONValue]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.name = name
        self.isStart = isStart
        self.metadata = metadata
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(Hangup.self, forKey: .type)
        self.name = try container.decode(String.self, forKey: .name)
        self.isStart = try container.decodeIfPresent(Bool.self, forKey: .isStart)
        self.metadata = try container.decodeIfPresent([String: JSONValue].self, forKey: .metadata)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.isStart, forKey: .isStart)
        try container.encodeIfPresent(self.metadata, forKey: .metadata)
    }

    public enum Hangup: String, Codable, Hashable, CaseIterable, Sendable {
        case hangup
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case name
        case isStart
        case metadata
    }
}