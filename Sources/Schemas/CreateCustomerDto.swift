import Foundation

public struct CreateCustomerDto: Codable, Hashable, Sendable {
    /// This is the flag to toggle the E164 check for the `number` field. This is an advanced property which should be used if you know your use case requires it.
    /// 
    /// Use cases:
    /// - `false`: To allow non-E164 numbers like `+001234567890`, `1234`, or `abc`. This is useful for dialing out to non-E164 numbers on your SIP trunks.
    /// - `true` (default): To allow only E164 numbers like `+14155551234`. This is standard for PSTN calls.
    /// 
    /// If `false`, the `number` is still required to only contain alphanumeric characters (regex: `/^\+?[a-zA-Z0-9]+$/`).
    /// 
    /// @default true (E164 check is enabled)
    public let numberE164CheckEnabled: Bool?
    /// This is the extension that will be dialed after the call is answered.
    public let `extension`: String?
    /// These are the overrides for the assistant's settings and template variables specific to this customer.
    /// This allows customization of the assistant's behavior for individual customers in batch calls.
    public let assistantOverrides: AssistantOverrides?
    /// This is the number of the customer.
    public let number: String?
    /// This is the SIP URI of the customer.
    public let sipUri: String?
    /// This is the name of the customer. This is just for your own reference.
    /// 
    /// For SIP inbound calls, this is extracted from the `From` SIP header with format `"Display Name" <sip:username@domain>`.
    public let name: String?
    /// This is the email of the customer.
    public let email: String?
    /// This is the external ID of the customer.
    public let externalId: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        numberE164CheckEnabled: Bool? = nil,
        extension: String? = nil,
        assistantOverrides: AssistantOverrides? = nil,
        number: String? = nil,
        sipUri: String? = nil,
        name: String? = nil,
        email: String? = nil,
        externalId: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.numberE164CheckEnabled = numberE164CheckEnabled
        self.extension = `extension`
        self.assistantOverrides = assistantOverrides
        self.number = number
        self.sipUri = sipUri
        self.name = name
        self.email = email
        self.externalId = externalId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.numberE164CheckEnabled = try container.decodeIfPresent(Bool.self, forKey: .numberE164CheckEnabled)
        self.extension = try container.decodeIfPresent(String.self, forKey: .extension)
        self.assistantOverrides = try container.decodeIfPresent(AssistantOverrides.self, forKey: .assistantOverrides)
        self.number = try container.decodeIfPresent(String.self, forKey: .number)
        self.sipUri = try container.decodeIfPresent(String.self, forKey: .sipUri)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.externalId = try container.decodeIfPresent(String.self, forKey: .externalId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.numberE164CheckEnabled, forKey: .numberE164CheckEnabled)
        try container.encodeIfPresent(self.extension, forKey: .extension)
        try container.encodeIfPresent(self.assistantOverrides, forKey: .assistantOverrides)
        try container.encodeIfPresent(self.number, forKey: .number)
        try container.encodeIfPresent(self.sipUri, forKey: .sipUri)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.externalId, forKey: .externalId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case numberE164CheckEnabled
        case `extension`
        case assistantOverrides
        case number
        case sipUri
        case name
        case email
        case externalId
    }
}