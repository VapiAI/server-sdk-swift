import Foundation

public struct SimulationSuiteTargetAssignment: Codable, Hashable, Sendable {
    /// This is the type of target assigned to the simulation suite.
    public let targetType: SimulationSuiteTargetAssignmentTargetType
    /// This is the unique identifier of the assigned assistant or squad.
    public let targetId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        targetType: SimulationSuiteTargetAssignmentTargetType,
        targetId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.targetType = targetType
        self.targetId = targetId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.targetType = try container.decode(SimulationSuiteTargetAssignmentTargetType.self, forKey: .targetType)
        self.targetId = try container.decode(String.self, forKey: .targetId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.targetType, forKey: .targetType)
        try container.encode(self.targetId, forKey: .targetId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case targetType
        case targetId
    }
}