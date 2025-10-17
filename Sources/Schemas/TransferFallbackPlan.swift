import Foundation

public struct TransferFallbackPlan: Codable, Hashable, Sendable {
    /// This is the message the assistant will deliver to the customer if the transfer fails.
    public let message: TransferFallbackPlanMessage
    /// This controls what happens after delivering the failure message to the customer.
    /// - true: End the call after delivering the failure message (default)
    /// - false: Keep the assistant on the call to continue handling the customer's request
    /// 
    /// @default true
    public let endCallEnabled: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        message: TransferFallbackPlanMessage,
        endCallEnabled: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.message = message
        self.endCallEnabled = endCallEnabled
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decode(TransferFallbackPlanMessage.self, forKey: .message)
        self.endCallEnabled = try container.decodeIfPresent(Bool.self, forKey: .endCallEnabled)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.message, forKey: .message)
        try container.encodeIfPresent(self.endCallEnabled, forKey: .endCallEnabled)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case message
        case endCallEnabled
    }
}