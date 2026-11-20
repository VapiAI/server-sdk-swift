import Foundation

public struct SimulationOnboardingOpenQuestionDto: Codable, Hashable, Sendable {
    /// Question id within its draft, e.g. `Q1`.
    public let id: String
    /// A question about expected assistant behavior that needs clarification.
    public let text: String
    /// Which requirement the answer changes, and how.
    public let why: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        text: String,
        why: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.text = text
        self.why = why
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.text = try container.decode(String.self, forKey: .text)
        self.why = try container.decode(String.self, forKey: .why)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.text, forKey: .text)
        try container.encode(self.why, forKey: .why)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case text
        case why
    }
}