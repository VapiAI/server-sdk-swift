import Foundation

public struct ClientInboundMessageAppendContext: Codable, Hashable, Sendable {
    /// Commentary is spoken in the model's own words; thinking is silent context;
    /// instructions steer the speaker, including requests to try saying something.
    /// Acceptance does not guarantee exact wording or speech completion.
    public let kind: ClientInboundMessageAppendContextKind
    public let content: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        kind: ClientInboundMessageAppendContextKind,
        content: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.kind = kind
        self.content = content
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.kind = try container.decode(ClientInboundMessageAppendContextKind.self, forKey: .kind)
        self.content = try container.decode(String.self, forKey: .content)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.kind, forKey: .kind)
        try container.encode(self.content, forKey: .content)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case kind
        case content
    }
}