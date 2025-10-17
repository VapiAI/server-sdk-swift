import Foundation

public struct ResponseTextDeltaEvent: Codable, Hashable, Sendable {
    /// Index of the content part
    public let contentIndex: Double
    /// Text delta being added
    public let delta: String
    /// ID of the output item
    public let itemId: String
    /// Index of the output item
    public let outputIndex: Double
    /// Event type
    public let type: ResponseOutputTextDelta
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        contentIndex: Double,
        delta: String,
        itemId: String,
        outputIndex: Double,
        type: ResponseOutputTextDelta,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.contentIndex = contentIndex
        self.delta = delta
        self.itemId = itemId
        self.outputIndex = outputIndex
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.contentIndex = try container.decode(Double.self, forKey: .contentIndex)
        self.delta = try container.decode(String.self, forKey: .delta)
        self.itemId = try container.decode(String.self, forKey: .itemId)
        self.outputIndex = try container.decode(Double.self, forKey: .outputIndex)
        self.type = try container.decode(ResponseOutputTextDelta.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.contentIndex, forKey: .contentIndex)
        try container.encode(self.delta, forKey: .delta)
        try container.encode(self.itemId, forKey: .itemId)
        try container.encode(self.outputIndex, forKey: .outputIndex)
        try container.encode(self.type, forKey: .type)
    }

    public enum ResponseOutputTextDelta: String, Codable, Hashable, CaseIterable, Sendable {
        case responseOutputTextDelta = "response.output_text.delta"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case contentIndex = "content_index"
        case delta
        case itemId = "item_id"
        case outputIndex = "output_index"
        case type
    }
}