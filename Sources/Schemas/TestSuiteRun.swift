import Foundation

public struct TestSuiteRun: Codable, Hashable, Sendable {
    /// This is the current status of the test suite run.
    public let status: TestSuiteRunStatus
    /// This is the unique identifier for the test suite run.
    public let id: String
    /// This is the unique identifier for the organization this run belongs to.
    public let orgId: String
    /// This is the unique identifier for the test suite this run belongs to.
    public let testSuiteId: String
    /// This is the ISO 8601 date-time string of when the test suite run was created.
    public let createdAt: Date
    /// This is the ISO 8601 date-time string of when the test suite run was last updated.
    public let updatedAt: Date
    /// These are the results of the tests in this test suite run.
    public let testResults: [TestSuiteRunTestResult]
    /// This is the name of the test suite run.
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        status: TestSuiteRunStatus,
        id: String,
        orgId: String,
        testSuiteId: String,
        createdAt: Date,
        updatedAt: Date,
        testResults: [TestSuiteRunTestResult],
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.status = status
        self.id = id
        self.orgId = orgId
        self.testSuiteId = testSuiteId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.testResults = testResults
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(TestSuiteRunStatus.self, forKey: .status)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.testSuiteId = try container.decode(String.self, forKey: .testSuiteId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.testResults = try container.decode([TestSuiteRunTestResult].self, forKey: .testResults)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.testSuiteId, forKey: .testSuiteId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.testResults, forKey: .testResults)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case status
        case id
        case orgId
        case testSuiteId
        case createdAt
        case updatedAt
        case testResults
        case name
    }
}