import Foundation

public struct TestSuiteRunTestResult: Codable, Hashable, Sendable {
    /// This is the test that was run.
    public let test: TestSuiteTestVoice
    /// These are the attempts made for this test.
    public let attempts: [TestSuiteRunTestAttempt]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        test: TestSuiteTestVoice,
        attempts: [TestSuiteRunTestAttempt],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.test = test
        self.attempts = attempts
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.test = try container.decode(TestSuiteTestVoice.self, forKey: .test)
        self.attempts = try container.decode([TestSuiteRunTestAttempt].self, forKey: .attempts)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.test, forKey: .test)
        try container.encode(self.attempts, forKey: .attempts)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case test
        case attempts
    }
}