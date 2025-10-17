import Foundation

public struct HmacAuthenticationPlan: Codable, Hashable, Sendable {
    /// This is the HMAC secret key used to sign requests.
    public let secretKey: String
    /// This is the HMAC algorithm to use for signing.
    public let algorithm: HmacAuthenticationPlanAlgorithm
    /// This is the header name where the signature will be sent. Defaults to 'x-signature'.
    public let signatureHeader: String?
    /// This is the header name where the timestamp will be sent. Defaults to 'x-timestamp'.
    public let timestampHeader: String?
    /// This is the prefix for the signature. For example, 'sha256=' for GitHub-style signatures.
    public let signaturePrefix: String?
    /// Whether to include a timestamp in the signature payload. Defaults to true.
    public let includeTimestamp: Bool?
    /// Custom payload format. Use {body} for request body, {timestamp} for timestamp, {method} for HTTP method, {url} for URL, {svix-id} for unique message ID. Defaults to '{timestamp}.{body}'.
    public let payloadFormat: String?
    /// This is the header name where the unique message ID will be sent. Used for Svix-style webhooks.
    public let messageIdHeader: String?
    /// The encoding format for the signature. Defaults to 'hex'.
    public let signatureEncoding: HmacAuthenticationPlanSignatureEncoding?
    /// Whether the secret key is base64-encoded and should be decoded before use. Defaults to false.
    public let secretIsBase64: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        secretKey: String,
        algorithm: HmacAuthenticationPlanAlgorithm,
        signatureHeader: String? = nil,
        timestampHeader: String? = nil,
        signaturePrefix: String? = nil,
        includeTimestamp: Bool? = nil,
        payloadFormat: String? = nil,
        messageIdHeader: String? = nil,
        signatureEncoding: HmacAuthenticationPlanSignatureEncoding? = nil,
        secretIsBase64: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.secretKey = secretKey
        self.algorithm = algorithm
        self.signatureHeader = signatureHeader
        self.timestampHeader = timestampHeader
        self.signaturePrefix = signaturePrefix
        self.includeTimestamp = includeTimestamp
        self.payloadFormat = payloadFormat
        self.messageIdHeader = messageIdHeader
        self.signatureEncoding = signatureEncoding
        self.secretIsBase64 = secretIsBase64
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.secretKey = try container.decode(String.self, forKey: .secretKey)
        self.algorithm = try container.decode(HmacAuthenticationPlanAlgorithm.self, forKey: .algorithm)
        self.signatureHeader = try container.decodeIfPresent(String.self, forKey: .signatureHeader)
        self.timestampHeader = try container.decodeIfPresent(String.self, forKey: .timestampHeader)
        self.signaturePrefix = try container.decodeIfPresent(String.self, forKey: .signaturePrefix)
        self.includeTimestamp = try container.decodeIfPresent(Bool.self, forKey: .includeTimestamp)
        self.payloadFormat = try container.decodeIfPresent(String.self, forKey: .payloadFormat)
        self.messageIdHeader = try container.decodeIfPresent(String.self, forKey: .messageIdHeader)
        self.signatureEncoding = try container.decodeIfPresent(HmacAuthenticationPlanSignatureEncoding.self, forKey: .signatureEncoding)
        self.secretIsBase64 = try container.decodeIfPresent(Bool.self, forKey: .secretIsBase64)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.secretKey, forKey: .secretKey)
        try container.encode(self.algorithm, forKey: .algorithm)
        try container.encodeIfPresent(self.signatureHeader, forKey: .signatureHeader)
        try container.encodeIfPresent(self.timestampHeader, forKey: .timestampHeader)
        try container.encodeIfPresent(self.signaturePrefix, forKey: .signaturePrefix)
        try container.encodeIfPresent(self.includeTimestamp, forKey: .includeTimestamp)
        try container.encodeIfPresent(self.payloadFormat, forKey: .payloadFormat)
        try container.encodeIfPresent(self.messageIdHeader, forKey: .messageIdHeader)
        try container.encodeIfPresent(self.signatureEncoding, forKey: .signatureEncoding)
        try container.encodeIfPresent(self.secretIsBase64, forKey: .secretIsBase64)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case secretKey
        case algorithm
        case signatureHeader
        case timestampHeader
        case signaturePrefix
        case includeTimestamp
        case payloadFormat
        case messageIdHeader
        case signatureEncoding
        case secretIsBase64
    }
}