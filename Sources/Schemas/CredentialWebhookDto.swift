import Foundation

public struct CredentialWebhookDto: Codable, Hashable, Sendable {
    public let type: CredentialWebhookDtoType
    public let operation: CredentialWebhookDtoOperation
    public let from: String
    public let connectionId: String
    public let authMode: CredentialWebhookDtoAuthMode
    public let providerConfigKey: String
    public let provider: String
    public let environment: String
    public let success: Bool
    public let endUser: CredentialEndUser
    public let error: CredentialSessionError?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: CredentialWebhookDtoType,
        operation: CredentialWebhookDtoOperation,
        from: String,
        connectionId: String,
        authMode: CredentialWebhookDtoAuthMode,
        providerConfigKey: String,
        provider: String,
        environment: String,
        success: Bool,
        endUser: CredentialEndUser,
        error: CredentialSessionError? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.operation = operation
        self.from = from
        self.connectionId = connectionId
        self.authMode = authMode
        self.providerConfigKey = providerConfigKey
        self.provider = provider
        self.environment = environment
        self.success = success
        self.endUser = endUser
        self.error = error
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(CredentialWebhookDtoType.self, forKey: .type)
        self.operation = try container.decode(CredentialWebhookDtoOperation.self, forKey: .operation)
        self.from = try container.decode(String.self, forKey: .from)
        self.connectionId = try container.decode(String.self, forKey: .connectionId)
        self.authMode = try container.decode(CredentialWebhookDtoAuthMode.self, forKey: .authMode)
        self.providerConfigKey = try container.decode(String.self, forKey: .providerConfigKey)
        self.provider = try container.decode(String.self, forKey: .provider)
        self.environment = try container.decode(String.self, forKey: .environment)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.endUser = try container.decode(CredentialEndUser.self, forKey: .endUser)
        self.error = try container.decodeIfPresent(CredentialSessionError.self, forKey: .error)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.operation, forKey: .operation)
        try container.encode(self.from, forKey: .from)
        try container.encode(self.connectionId, forKey: .connectionId)
        try container.encode(self.authMode, forKey: .authMode)
        try container.encode(self.providerConfigKey, forKey: .providerConfigKey)
        try container.encode(self.provider, forKey: .provider)
        try container.encode(self.environment, forKey: .environment)
        try container.encode(self.success, forKey: .success)
        try container.encode(self.endUser, forKey: .endUser)
        try container.encodeIfPresent(self.error, forKey: .error)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case operation
        case from
        case connectionId
        case authMode
        case providerConfigKey
        case provider
        case environment
        case success
        case endUser
        case error
    }
}