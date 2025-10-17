import Foundation

public struct ResponseTextDoneEvent: Codable, Hashable, Sendable {
    /// Index of the content part
    public let contentIndex: Double
    /// ID of the output item
    public let itemId: String
    /// Index of the output item
    public let outputIndex: Double
    /// Complete text content
    public let text: String
    /// Event type
    public let type: ResponseOutputTextDone
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        contentIndex: Double,
        itemId: String,
        outputIndex: Double,
        text: String,
        type: ResponseOutputTextDone,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.contentIndex = contentIndex
        self.itemId = itemId
        self.outputIndex = outputIndex
        self.text = text
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.contentIndex = try container.decode(Double.self, forKey: .contentIndex)
        self.itemId = try container.decode(String.self, forKey: .itemId)
        self.outputIndex = try container.decode(Double.self, forKey: .outputIndex)
        self.text = try container.decode(String.self, forKey: .text)
        self.type = try container.decode(ResponseOutputTextDone.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.contentIndex, forKey: .contentIndex)
        try container.encode(self.itemId, forKey: .itemId)
        try container.encode(self.outputIndex, forKey: .outputIndex)
        try container.encode(self.text, forKey: .text)
        try container.encode(self.type, forKey: .type)
    }

    public enum ResponseOutputTextDone: String, Codable, Hashable, CaseIterable, Sendable {
        case responseOutputTextDone = "response.output_text.done"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case contentIndex = "content_index"
        case itemId = "item_id"
        case outputIndex = "output_index"
        case text
        case type
    }
}