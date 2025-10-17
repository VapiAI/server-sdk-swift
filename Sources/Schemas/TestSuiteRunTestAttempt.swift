import Foundation

public struct TestSuiteRunTestAttempt: Codable, Hashable, Sendable {
    /// These are the results of the scorers used to evaluate the test attempt.
    public let scorerResults: [TestSuiteRunScorerAi]
    /// This is the call made during the test attempt.
    public let call: TestSuiteRunTestAttemptCall?
    /// This is the call ID for the test attempt.
    public let callId: String?
    /// This is the metadata for the test attempt.
    public let metadata: TestSuiteRunTestAttemptMetadata?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        scorerResults: [TestSuiteRunScorerAi],
        call: TestSuiteRunTestAttemptCall? = nil,
        callId: String? = nil,
        metadata: TestSuiteRunTestAttemptMetadata? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.scorerResults = scorerResults
        self.call = call
        self.callId = callId
        self.metadata = metadata
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.scorerResults = try container.decode([TestSuiteRunScorerAi].self, forKey: .scorerResults)
        self.call = try container.decodeIfPresent(TestSuiteRunTestAttemptCall.self, forKey: .call)
        self.callId = try container.decodeIfPresent(String.self, forKey: .callId)
        self.metadata = try container.decodeIfPresent(TestSuiteRunTestAttemptMetadata.self, forKey: .metadata)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.scorerResults, forKey: .scorerResults)
        try container.encodeIfPresent(self.call, forKey: .call)
        try container.encodeIfPresent(self.callId, forKey: .callId)
        try container.encodeIfPresent(self.metadata, forKey: .metadata)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case scorerResults
        case call
        case callId
        case metadata
    }
}