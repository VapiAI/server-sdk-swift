import Foundation

public struct SimulationOnboardingToolGapDto: Codable, Hashable, Sendable {
    /// Function name of the tool, e.g. `handoff_to_group_1` or `transferCall`.
    public let toolName: String
    /// Assistant the tool belongs to, when it is a handoff destination's tool. Unset for the assistant's own tools.
    public let assistantName: String?
    /// Why the path is not exercised: a reason the simulations mock the tool, or why a native path is never reached. New reasons may be added.
    public let reason: SimulationOnboardingToolGapDtoReason
    /// Static destinations the simulations do not reach through this tool.
    public let destinationNames: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        toolName: String,
        assistantName: String? = nil,
        reason: SimulationOnboardingToolGapDtoReason,
        destinationNames: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.toolName = toolName
        self.assistantName = assistantName
        self.reason = reason
        self.destinationNames = destinationNames
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.toolName = try container.decode(String.self, forKey: .toolName)
        self.assistantName = try container.decodeIfPresent(String.self, forKey: .assistantName)
        self.reason = try container.decode(SimulationOnboardingToolGapDtoReason.self, forKey: .reason)
        self.destinationNames = try container.decodeIfPresent([String].self, forKey: .destinationNames)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.toolName, forKey: .toolName)
        try container.encodeIfPresent(self.assistantName, forKey: .assistantName)
        try container.encode(self.reason, forKey: .reason)
        try container.encodeIfPresent(self.destinationNames, forKey: .destinationNames)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case toolName
        case assistantName
        case reason
        case destinationNames
    }
}