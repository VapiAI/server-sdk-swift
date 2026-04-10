import Foundation

public struct SpkiPemPublicKeyConfig: Codable, Hashable, Sendable {
    /// Optional name of the key for identification purposes.
    public let name: String?
    /// The PEM-encoded public key.
    public let pem: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String? = nil,
        pem: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.pem = pem
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.pem = try container.decode(String.self, forKey: .pem)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(self.pem, forKey: .pem)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case pem
    }
}