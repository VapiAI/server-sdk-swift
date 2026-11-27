import Foundation

public struct SimulationRunPaymentRequiredResponse: Codable, Hashable, Sendable {
    public let statusCode: Double
    public let message: String
    public let reason: SimulationRunPaymentRequiredResponseReason
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        statusCode: Double,
        message: String,
        reason: SimulationRunPaymentRequiredResponseReason,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.statusCode = statusCode
        self.message = message
        self.reason = reason
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.statusCode = try container.decode(Double.self, forKey: .statusCode)
        self.message = try container.decode(String.self, forKey: .message)
        self.reason = try container.decode(SimulationRunPaymentRequiredResponseReason.self, forKey: .reason)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.statusCode, forKey: .statusCode)
        try container.encode(self.message, forKey: .message)
        try container.encode(self.reason, forKey: .reason)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case statusCode
        case message
        case reason
    }
}