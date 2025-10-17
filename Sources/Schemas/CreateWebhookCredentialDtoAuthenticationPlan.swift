import Foundation

/// This is the authentication plan. Supports OAuth2 RFC 6749, HMAC signing, and Bearer authentication.
public enum CreateWebhookCredentialDtoAuthenticationPlan: Codable, Hashable, Sendable {
    case oauth2(Oauth2)
    case hmac(Hmac)
    case bearer(Bearer)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "oauth2":
            self = .oauth2(try Oauth2(from: decoder))
        case "hmac":
            self = .hmac(try Hmac(from: decoder))
        case "bearer":
            self = .bearer(try Bearer(from: decoder))
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unknown shape discriminant value: \(discriminant)"
                )
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        switch self {
        case .oauth2(let data):
            try data.encode(to: encoder)
        case .hmac(let data):
            try data.encode(to: encoder)
        case .bearer(let data):
            try data.encode(to: encoder)
        }
    }

    public struct Oauth2: Codable, Hashable, Sendable {
        public let type: String = "oauth2"
        /// This is the OAuth2 URL.
        public let url: String
        /// This is the OAuth2 client ID.
        public let clientId: String
        /// This is the OAuth2 client secret.
        public let clientSecret: String
        /// This is the scope of the OAuth2 token.
        public let scope: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            url: String,
            clientId: String,
            clientSecret: String,
            scope: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.url = url
            self.clientId = clientId
            self.clientSecret = clientSecret
            self.scope = scope
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.url = try container.decode(String.self, forKey: .url)
            self.clientId = try container.decode(String.self, forKey: .clientId)
            self.clientSecret = try container.decode(String.self, forKey: .clientSecret)
            self.scope = try container.decodeIfPresent(String.self, forKey: .scope)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encode(self.url, forKey: .url)
            try container.encode(self.clientId, forKey: .clientId)
            try container.encode(self.clientSecret, forKey: .clientSecret)
            try container.encodeIfPresent(self.scope, forKey: .scope)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case url
            case clientId
            case clientSecret
            case scope
        }
    }

    public struct Hmac: Codable, Hashable, Sendable {
        public let type: String = "hmac"
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
            try container.encode(self.type, forKey: .type)
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
            case type
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

    public struct Bearer: Codable, Hashable, Sendable {
        public let type: String = "bearer"
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
            try container.encode(self.type, forKey: .type)
            try container.encode(self.token, forKey: .token)
            try container.encodeIfPresent(self.headerName, forKey: .headerName)
            try container.encodeIfPresent(self.bearerPrefixEnabled, forKey: .bearerPrefixEnabled)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case token
            case headerName
            case bearerPrefixEnabled
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}