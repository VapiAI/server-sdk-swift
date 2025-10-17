import Foundation

public enum TestSuiteTestsPaginatedResponseResultsItem: Codable, Hashable, Sendable {
    case voice(Voice)
    case chat(Chat)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "voice":
            self = .voice(try Voice(from: decoder))
        case "chat":
            self = .chat(try Chat(from: decoder))
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unknown shape discriminant value: \(discriminant)"
                )
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        switch self {
        case .voice(let data):
            try data.encode(to: encoder)
        case .chat(let data):
            try data.encode(to: encoder)
        }
    }

    public struct Voice: Codable, Hashable, Sendable {
        public let type: String = "voice"
        /// These are the scorers used to evaluate the test.
        public let scorers: [TestSuiteTestScorerAi]
        /// This is the unique identifier for the test.
        public let id: String
        /// This is the unique identifier for the test suite this test belongs to.
        public let testSuiteId: String
        /// This is the unique identifier for the organization this test belongs to.
        public let orgId: String
        /// This is the ISO 8601 date-time string of when the test was created.
        public let createdAt: Date
        /// This is the ISO 8601 date-time string of when the test was last updated.
        public let updatedAt: Date
        /// This is the name of the test.
        public let name: String?
        /// This is the script to be used for the voice test.
        public let script: String
        /// This is the number of attempts allowed for the test.
        public let numAttempts: Double?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            scorers: [TestSuiteTestScorerAi],
            id: String,
            testSuiteId: String,
            orgId: String,
            createdAt: Date,
            updatedAt: Date,
            name: String? = nil,
            script: String,
            numAttempts: Double? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.scorers = scorers
            self.id = id
            self.testSuiteId = testSuiteId
            self.orgId = orgId
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.name = name
            self.script = script
            self.numAttempts = numAttempts
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.scorers = try container.decode([TestSuiteTestScorerAi].self, forKey: .scorers)
            self.id = try container.decode(String.self, forKey: .id)
            self.testSuiteId = try container.decode(String.self, forKey: .testSuiteId)
            self.orgId = try container.decode(String.self, forKey: .orgId)
            self.createdAt = try container.decode(Date.self, forKey: .createdAt)
            self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.script = try container.decode(String.self, forKey: .script)
            self.numAttempts = try container.decodeIfPresent(Double.self, forKey: .numAttempts)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encode(self.scorers, forKey: .scorers)
            try container.encode(self.id, forKey: .id)
            try container.encode(self.testSuiteId, forKey: .testSuiteId)
            try container.encode(self.orgId, forKey: .orgId)
            try container.encode(self.createdAt, forKey: .createdAt)
            try container.encode(self.updatedAt, forKey: .updatedAt)
            try container.encodeIfPresent(self.name, forKey: .name)
            try container.encode(self.script, forKey: .script)
            try container.encodeIfPresent(self.numAttempts, forKey: .numAttempts)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case scorers
            case id
            case testSuiteId
            case orgId
            case createdAt
            case updatedAt
            case name
            case script
            case numAttempts
        }
    }

    public struct Chat: Codable, Hashable, Sendable {
        public let type: String = "chat"
        /// These are the scorers used to evaluate the test.
        public let scorers: [TestSuiteTestScorerAi]
        /// This is the unique identifier for the test.
        public let id: String
        /// This is the unique identifier for the test suite this test belongs to.
        public let testSuiteId: String
        /// This is the unique identifier for the organization this test belongs to.
        public let orgId: String
        /// This is the ISO 8601 date-time string of when the test was created.
        public let createdAt: Date
        /// This is the ISO 8601 date-time string of when the test was last updated.
        public let updatedAt: Date
        /// This is the name of the test.
        public let name: String?
        /// This is the script to be used for the chat test.
        public let script: String
        /// This is the number of attempts allowed for the test.
        public let numAttempts: Double?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            scorers: [TestSuiteTestScorerAi],
            id: String,
            testSuiteId: String,
            orgId: String,
            createdAt: Date,
            updatedAt: Date,
            name: String? = nil,
            script: String,
            numAttempts: Double? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.scorers = scorers
            self.id = id
            self.testSuiteId = testSuiteId
            self.orgId = orgId
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.name = name
            self.script = script
            self.numAttempts = numAttempts
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.scorers = try container.decode([TestSuiteTestScorerAi].self, forKey: .scorers)
            self.id = try container.decode(String.self, forKey: .id)
            self.testSuiteId = try container.decode(String.self, forKey: .testSuiteId)
            self.orgId = try container.decode(String.self, forKey: .orgId)
            self.createdAt = try container.decode(Date.self, forKey: .createdAt)
            self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.script = try container.decode(String.self, forKey: .script)
            self.numAttempts = try container.decodeIfPresent(Double.self, forKey: .numAttempts)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encode(self.scorers, forKey: .scorers)
            try container.encode(self.id, forKey: .id)
            try container.encode(self.testSuiteId, forKey: .testSuiteId)
            try container.encode(self.orgId, forKey: .orgId)
            try container.encode(self.createdAt, forKey: .createdAt)
            try container.encode(self.updatedAt, forKey: .updatedAt)
            try container.encodeIfPresent(self.name, forKey: .name)
            try container.encode(self.script, forKey: .script)
            try container.encodeIfPresent(self.numAttempts, forKey: .numAttempts)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case scorers
            case id
            case testSuiteId
            case orgId
            case createdAt
            case updatedAt
            case name
            case script
            case numAttempts
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}