import Foundation

public struct ComplianceOverride: Codable, Hashable, Sendable {
    /// Force storage for this output under HIPAA. Only enable if output contains no sensitive data.
    public let forceStoreOnHipaaEnabled: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        forceStoreOnHipaaEnabled: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.forceStoreOnHipaaEnabled = forceStoreOnHipaaEnabled
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.forceStoreOnHipaaEnabled = try container.decodeIfPresent(Bool.self, forKey: .forceStoreOnHipaaEnabled)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.forceStoreOnHipaaEnabled, forKey: .forceStoreOnHipaaEnabled)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case forceStoreOnHipaaEnabled
    }
}