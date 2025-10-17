import Foundation

public struct BearerAuthenticationPlan: Codable, Hashable, Sendable {
    /// This is the bearer token value.
    public let token: String
    /// This is the header name where the bearer token will be sent. Defaults to 'Authorization'.
    public let headerName: String?
    /// Whether to include the 'Bearer ' prefix in the header value. Defaults to true.
    public let bearerPrefixEnabled: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        token: String,
        headerName: String? = nil,
        bearerPrefixEnabled: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.token = token
        self.headerName = headerName
        self.bearerPrefixEnabled = bearerPrefixEnabled
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.token = try container.decode(String.self, forKey: .token)
        self.headerName = try container.decodeIfPresent(String.self, forKey: .headerName)
        self.bearerPrefixEnabled = try container.decodeIfPresent(Bool.self, forKey: .bearerPrefixEnabled)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.token, forKey: .token)
        try container.encodeIfPresent(self.headerName, forKey: .headerName)
        try container.encodeIfPresent(self.bearerPrefixEnabled, forKey: .bearerPrefixEnabled)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case token
        case headerName
        case bearerPrefixEnabled
    }
}