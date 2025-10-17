import Foundation

public struct Server: Codable, Hashable, Sendable {
    /// This is the timeout in seconds for the request. Defaults to 20 seconds.
    /// 
    /// @default 20
    public let timeoutSeconds: Double?
    /// The credential ID for server authentication
    public let credentialId: String?
    /// This is where the request will be sent.
    public let url: String?
    /// These are the headers to include in the request.
    /// 
    /// Each key-value pair represents a header name and its value.
    /// 
    /// Note: Specifying an Authorization header here will override the authorization provided by the `credentialId` (if provided). This is an anti-pattern and should be avoided outside of edge case scenarios.
    public let headers: [String: JSONValue]?
    /// This is the backoff plan if the request fails. Defaults to undefined (the request will not be retried).
    /// 
    /// @default undefined (the request will not be retried)
    public let backoffPlan: BackoffPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        timeoutSeconds: Double? = nil,
        credentialId: String? = nil,
        url: String? = nil,
        headers: [String: JSONValue]? = nil,
        backoffPlan: BackoffPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.timeoutSeconds = timeoutSeconds
        self.credentialId = credentialId
        self.url = url
        self.headers = headers
        self.backoffPlan = backoffPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.timeoutSeconds = try container.decodeIfPresent(Double.self, forKey: .timeoutSeconds)
        self.credentialId = try container.decodeIfPresent(String.self, forKey: .credentialId)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.headers = try container.decodeIfPresent([String: JSONValue].self, forKey: .headers)
        self.backoffPlan = try container.decodeIfPresent(BackoffPlan.self, forKey: .backoffPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.timeoutSeconds, forKey: .timeoutSeconds)
        try container.encodeIfPresent(self.credentialId, forKey: .credentialId)
        try container.encodeIfPresent(self.url, forKey: .url)
        try container.encodeIfPresent(self.headers, forKey: .headers)
        try container.encodeIfPresent(self.backoffPlan, forKey: .backoffPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case timeoutSeconds
        case credentialId
        case url
        case headers
        case backoffPlan
    }
}