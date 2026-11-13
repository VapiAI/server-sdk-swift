import Foundation

public struct CallHealthDashboardAffectedCallDto: Codable, Hashable, Sendable {
    public let callId: String
    public let assistantId: String
    /// Call completion time (endedAt), never startedAt.
    public let callTime: Date
    public let callAvailability: CallHealthDashboardAffectedCallDtoCallAvailability
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        callId: String,
        assistantId: String,
        callTime: Date,
        callAvailability: CallHealthDashboardAffectedCallDtoCallAvailability,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.callId = callId
        self.assistantId = assistantId
        self.callTime = callTime
        self.callAvailability = callAvailability
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.callId = try container.decode(String.self, forKey: .callId)
        self.assistantId = try container.decode(String.self, forKey: .assistantId)
        self.callTime = try container.decode(Date.self, forKey: .callTime)
        self.callAvailability = try container.decode(CallHealthDashboardAffectedCallDtoCallAvailability.self, forKey: .callAvailability)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.callId, forKey: .callId)
        try container.encode(self.assistantId, forKey: .assistantId)
        try container.encode(self.callTime, forKey: .callTime)
        try container.encode(self.callAvailability, forKey: .callAvailability)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case callId
        case assistantId
        case callTime
        case callAvailability
    }
}