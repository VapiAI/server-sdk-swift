import Foundation

public struct DialPlanEntry: Codable, Hashable, Sendable {
    /// The phone number ID to use for calling the customers in this entry.
    public let phoneNumberId: String
    /// The list of customers to call using this phone number.
    public let customers: [CreateCustomerDto]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        phoneNumberId: String,
        customers: [CreateCustomerDto],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.phoneNumberId = phoneNumberId
        self.customers = customers
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.phoneNumberId = try container.decode(String.self, forKey: .phoneNumberId)
        self.customers = try container.decode([CreateCustomerDto].self, forKey: .customers)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.phoneNumberId, forKey: .phoneNumberId)
        try container.encode(self.customers, forKey: .customers)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case phoneNumberId
        case customers
    }
}