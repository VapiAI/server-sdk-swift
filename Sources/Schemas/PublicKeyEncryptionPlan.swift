import Foundation

public struct PublicKeyEncryptionPlan: Codable, Hashable, Sendable {
    /// The encryption algorithm to use.
    public let algorithm: PublicKeyEncryptionPlanAlgorithm
    /// The public key configuration.
    public let publicKey: PublicKeyEncryptionPlanPublicKey
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        algorithm: PublicKeyEncryptionPlanAlgorithm,
        publicKey: PublicKeyEncryptionPlanPublicKey,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.algorithm = algorithm
        self.publicKey = publicKey
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.algorithm = try container.decode(PublicKeyEncryptionPlanAlgorithm.self, forKey: .algorithm)
        self.publicKey = try container.decode(PublicKeyEncryptionPlanPublicKey.self, forKey: .publicKey)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.algorithm, forKey: .algorithm)
        try container.encode(self.publicKey, forKey: .publicKey)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case algorithm
        case publicKey
    }
}