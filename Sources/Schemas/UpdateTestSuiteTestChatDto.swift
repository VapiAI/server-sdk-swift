import Foundation

public struct UpdateTestSuiteTestChatDto: Codable, Hashable, Sendable {
    /// These are the scorers used to evaluate the test.
    public let scorers: [TestSuiteTestScorerAi]?
    /// This is the type of the test, which must be chat.
    public let type: Chat?
    /// This is the name of the test.
    public let name: String?
    /// This is the script to be used for the chat test.
    public let script: String?
    /// This is the number of attempts allowed for the test.
    public let numAttempts: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        scorers: [TestSuiteTestScorerAi]? = nil,
        type: Chat? = nil,
        name: String? = nil,
        script: String? = nil,
        numAttempts: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.scorers = scorers
        self.type = type
        self.name = name
        self.script = script
        self.numAttempts = numAttempts
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.scorers = try container.decodeIfPresent([TestSuiteTestScorerAi].self, forKey: .scorers)
        self.type = try container.decodeIfPresent(Chat.self, forKey: .type)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.script = try container.decodeIfPresent(String.self, forKey: .script)
        self.numAttempts = try container.decodeIfPresent(Double.self, forKey: .numAttempts)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.scorers, forKey: .scorers)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.script, forKey: .script)
        try container.encodeIfPresent(self.numAttempts, forKey: .numAttempts)
    }

    public enum Chat: String, Codable, Hashable, CaseIterable, Sendable {
        case chat
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case scorers
        case type
        case name
        case script
        case numAttempts
    }
}