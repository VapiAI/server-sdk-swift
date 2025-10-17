import Foundation

public struct TestSuitePhoneNumber: Codable, Hashable, Sendable {
    /// This is the provider of the phone number.
    public let provider: TestSuite
    /// This is the phone number that is being tested.
    public let number: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        provider: TestSuite,
        number: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.provider = provider
        self.number = number
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.provider = try container.decode(TestSuite.self, forKey: .provider)
        self.number = try container.decode(String.self, forKey: .number)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.provider, forKey: .provider)
        try container.encode(self.number, forKey: .number)
    }

    public enum TestSuite: String, Codable, Hashable, CaseIterable, Sendable {
        case testSuite = "test-suite"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
        case number
    }
}