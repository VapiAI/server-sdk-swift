import Foundation

public struct CreateTestSuiteDto: Codable, Hashable, Sendable {
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
        name: String? = nil,
        phoneNumberId: String? = nil,
        testerPlan: TesterPlan? = nil,
        targetPlan: TargetPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.phoneNumberId = phoneNumberId
        self.testerPlan = testerPlan
        self.targetPlan = targetPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.phoneNumberId = try container.decodeIfPresent(String.self, forKey: .phoneNumberId)
        self.testerPlan = try container.decodeIfPresent(TesterPlan.self, forKey: .testerPlan)
        self.targetPlan = try container.decodeIfPresent(TargetPlan.self, forKey: .targetPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.phoneNumberId, forKey: .phoneNumberId)
        try container.encodeIfPresent(self.testerPlan, forKey: .testerPlan)
        try container.encodeIfPresent(self.targetPlan, forKey: .targetPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case phoneNumberId
        case testerPlan
        case targetPlan
    }
}