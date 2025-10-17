import Foundation

public struct TargetPlan: Codable, Hashable, Sendable {
    /// This is the phone number that is being tested.
    /// During the actual test, it'll be called and the assistant attached to it will pick up and be tested.
    /// To test an assistant directly, send assistantId instead.
    public let phoneNumberId: String?
    /// This can be any phone number (even not on Vapi).
    /// During the actual test, it'll be called.
    /// To test a Vapi number, send phoneNumberId. To test an assistant directly, send assistantId instead.
    public let phoneNumber: TestSuitePhoneNumber?
    /// This is the assistant being tested.
    /// During the actual test, it'll invoked directly.
    /// To test the assistant over phone number, send phoneNumberId instead.
    public let assistantId: String?
    /// This is the assistant overrides applied to assistantId before it is tested.
    public let assistantOverrides: AssistantOverrides?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        phoneNumberId: String? = nil,
        phoneNumber: TestSuitePhoneNumber? = nil,
        assistantId: String? = nil,
        assistantOverrides: AssistantOverrides? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.phoneNumberId = phoneNumberId
        self.phoneNumber = phoneNumber
        self.assistantId = assistantId
        self.assistantOverrides = assistantOverrides
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.phoneNumberId = try container.decodeIfPresent(String.self, forKey: .phoneNumberId)
        self.phoneNumber = try container.decodeIfPresent(TestSuitePhoneNumber.self, forKey: .phoneNumber)
        self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
        self.assistantOverrides = try container.decodeIfPresent(AssistantOverrides.self, forKey: .assistantOverrides)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.phoneNumberId, forKey: .phoneNumberId)
        try container.encodeIfPresent(self.phoneNumber, forKey: .phoneNumber)
        try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
        try container.encodeIfPresent(self.assistantOverrides, forKey: .assistantOverrides)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case phoneNumberId
        case phoneNumber
        case assistantId
        case assistantOverrides
    }
}