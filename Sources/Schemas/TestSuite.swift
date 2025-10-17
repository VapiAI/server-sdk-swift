import Foundation

public struct TestSuite: Codable, Hashable, Sendable {
    /// This is the unique identifier for the test suite.
    public let id: String
    /// This is the unique identifier for the org that this test suite belongs to.
    public let orgId: String
    /// This is the ISO 8601 date-time string of when the test suite was created.
    public let createdAt: Date
    /// This is the ISO 8601 date-time string of when the test suite was last updated.
    public let updatedAt: Date
    /// This is the name of the test suite.
    public let name: String?
    /// This is the phone number ID associated with this test suite.
    public let phoneNumberId: String?
    /// Override the default tester plan by providing custom assistant configuration for the test agent.
    /// 
    /// We recommend only using this if you are confident, as we have already set sensible defaults on the tester plan.
    public let testerPlan: TesterPlan?
    /// These are the configuration for the assistant / phone number that is being tested.
    public let targetPlan: TargetPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        name: String? = nil,
        phoneNumberId: String? = nil,
        testerPlan: TesterPlan? = nil,
        targetPlan: TargetPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.phoneNumberId = phoneNumberId
        self.testerPlan = testerPlan
        self.targetPlan = targetPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.phoneNumberId = try container.decodeIfPresent(String.self, forKey: .phoneNumberId)
        self.testerPlan = try container.decodeIfPresent(TesterPlan.self, forKey: .testerPlan)
        self.targetPlan = try container.decodeIfPresent(TargetPlan.self, forKey: .targetPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.phoneNumberId, forKey: .phoneNumberId)
        try container.encodeIfPresent(self.testerPlan, forKey: .testerPlan)
        try container.encodeIfPresent(self.targetPlan, forKey: .targetPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case orgId
        case createdAt
        case updatedAt
        case name
        case phoneNumberId
        case testerPlan
        case targetPlan
    }
}