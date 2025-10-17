import Foundation

public struct CreateTestSuiteTestVoiceDto: Codable, Hashable, Sendable {
    /// These are the scorers used to evaluate the test.
    public let scorers: [TestSuiteTestScorerAi]
    /// This is the type of the test, which must be voice.
    public let type: Voice
    /// This is the script to be used for the voice test.
    public let script: String
    /// This is the number of attempts allowed for the test.
    public let numAttempts: Double?
    /// This is the name of the test.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        scorers: [TestSuiteTestScorerAi],
        type: Voice,
        script: String,
        numAttempts: Double? = nil,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.scorers = scorers
        self.type = type
        self.script = script
        self.numAttempts = numAttempts
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.scorers = try container.decode([TestSuiteTestScorerAi].self, forKey: .scorers)
        self.type = try container.decode(Voice.self, forKey: .type)
        self.script = try container.decode(String.self, forKey: .script)
        self.numAttempts = try container.decodeIfPresent(Double.self, forKey: .numAttempts)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.scorers, forKey: .scorers)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.script, forKey: .script)
        try container.encodeIfPresent(self.numAttempts, forKey: .numAttempts)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    public enum Voice: String, Codable, Hashable, CaseIterable, Sendable {
        case voice
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case scorers
        case type
        case script
        case numAttempts
        case name
    }
}