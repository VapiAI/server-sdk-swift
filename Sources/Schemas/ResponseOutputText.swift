import Foundation

public struct ResponseOutputText: Codable, Hashable, Sendable {
    /// Annotations in the text output
    public let annotations: [[String: JSONValue]]
    /// The text output from the model
    public let text: String
    /// The type of the output text
    public let type: OutputText
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        annotations: [[String: JSONValue]],
        text: String,
        type: OutputText,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.annotations = annotations
        self.text = text
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.annotations = try container.decode([[String: JSONValue]].self, forKey: .annotations)
        self.text = try container.decode(String.self, forKey: .text)
        self.type = try container.decode(OutputText.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.annotations, forKey: .annotations)
        try container.encode(self.text, forKey: .text)
        try container.encode(self.type, forKey: .type)
    }

    public enum OutputText: String, Codable, Hashable, CaseIterable, Sendable {
        case outputText = "output_text"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case annotations
        case text
        case type
    }
}