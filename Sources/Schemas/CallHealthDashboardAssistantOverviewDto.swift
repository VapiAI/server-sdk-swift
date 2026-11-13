import Foundation

public struct CallHealthDashboardAssistantOverviewDto: Codable, Hashable, Sendable {
    /// Current permitted assistant metadata, fetched in a batch.
    public let assistant: CallHealthDashboardAssistantReferenceDto
    /// Every row represents an explicitly selected, tenant-owned assistant goal.
    public let goalDefinition: CallHealthDashboardGoalDefinitionDto
    /// Window totals for the selected goal, including zero-result assistants.
    public let goal: CallHealthDashboardGoalSummaryDto
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        assistant: CallHealthDashboardAssistantReferenceDto,
        goalDefinition: CallHealthDashboardGoalDefinitionDto,
        goal: CallHealthDashboardGoalSummaryDto,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.assistant = assistant
        self.goalDefinition = goalDefinition
        self.goal = goal
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assistant = try container.decode(CallHealthDashboardAssistantReferenceDto.self, forKey: .assistant)
        self.goalDefinition = try container.decode(CallHealthDashboardGoalDefinitionDto.self, forKey: .goalDefinition)
        self.goal = try container.decode(CallHealthDashboardGoalSummaryDto.self, forKey: .goal)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.assistant, forKey: .assistant)
        try container.encode(self.goalDefinition, forKey: .goalDefinition)
        try container.encode(self.goal, forKey: .goal)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case assistant
        case goalDefinition
        case goal
    }
}