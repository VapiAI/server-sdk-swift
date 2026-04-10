import Foundation

public struct VapiSipTransportMessage: Codable, Hashable, Sendable {
    /// This is the SIP verb to use. Must be one of INFO, MESSAGE, or NOTIFY.
    public let sipVerb: VapiSipTransportMessageSipVerb
    /// These are the headers to include with the SIP request.
    public let headers: [String: JSONValue]?
    /// This is the body of the SIP request, if any.
    public let body: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        sipVerb: VapiSipTransportMessageSipVerb,
        headers: [String: JSONValue]? = nil,
        body: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.sipVerb = sipVerb
        self.headers = headers
        self.body = body
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.sipVerb = try container.decode(VapiSipTransportMessageSipVerb.self, forKey: .sipVerb)
        self.headers = try container.decodeIfPresent([String: JSONValue].self, forKey: .headers)
        self.body = try container.decodeIfPresent(String.self, forKey: .body)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.sipVerb, forKey: .sipVerb)
        try container.encodeIfPresent(self.headers, forKey: .headers)
        try container.encodeIfPresent(self.body, forKey: .body)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case sipVerb
        case headers
        case body
    }
}