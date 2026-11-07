import Foundation

public struct CallHealthDashboardWindowDto: Codable, Hashable, Sendable {
    public let callTimeGte: Date
    public let callTimeLt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        callTimeGte: Date,
        callTimeLt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.callTimeGte = callTimeGte
        self.callTimeLt = callTimeLt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.callTimeGte = try container.decode(Date.self, forKey: .callTimeGte)
        self.callTimeLt = try container.decode(Date.self, forKey: .callTimeLt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.callTimeGte, forKey: .callTimeGte)
        try container.encode(self.callTimeLt, forKey: .callTimeLt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case callTimeGte
        case callTimeLt
    }
}