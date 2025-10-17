import Foundation

public struct InvoicePlan: Codable, Hashable, Sendable {
    /// This is the name of the company.
    public let companyName: String?
    /// This is the address of the company.
    public let companyAddress: String?
    /// This is the tax ID of the company.
    public let companyTaxId: String?
    /// This is the preferred invoicing email of the company. If not specified, defaults to the subscription's email.
    public let companyEmail: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        companyName: String? = nil,
        companyAddress: String? = nil,
        companyTaxId: String? = nil,
        companyEmail: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.companyName = companyName
        self.companyAddress = companyAddress
        self.companyTaxId = companyTaxId
        self.companyEmail = companyEmail
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.companyName = try container.decodeIfPresent(String.self, forKey: .companyName)
        self.companyAddress = try container.decodeIfPresent(String.self, forKey: .companyAddress)
        self.companyTaxId = try container.decodeIfPresent(String.self, forKey: .companyTaxId)
        self.companyEmail = try container.decodeIfPresent(String.self, forKey: .companyEmail)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.companyName, forKey: .companyName)
        try container.encodeIfPresent(self.companyAddress, forKey: .companyAddress)
        try container.encodeIfPresent(self.companyTaxId, forKey: .companyTaxId)
        try container.encodeIfPresent(self.companyEmail, forKey: .companyEmail)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case companyName
        case companyAddress
        case companyTaxId
        case companyEmail
    }
}