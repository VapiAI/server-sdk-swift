import Foundation

public struct CallBatchError: Codable, Hashable, Sendable {
    public let customer: CreateCustomerDto
    public let error: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        customer: CreateCustomerDto,
        error: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.customer = customer
        self.error = error
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.customer = try container.decode(CreateCustomerDto.self, forKey: .customer)
        self.error = try container.decode(String.self, forKey: .error)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.customer, forKey: .customer)
        try container.encode(self.error, forKey: .error)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case customer
        case error
    }
}