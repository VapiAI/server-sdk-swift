import Foundation

public struct CallHealthDashboardCoverageDto: Codable, Hashable, Sendable {
    public let asOf: Date
    public let intake: CallHealthDashboardIntakeCoverageDto
    public let goal: CallHealthDashboardGoalGapsDto
    public let classification: CallHealthDashboardClassificationCoverageDto
    public let assignment: CallHealthDashboardAssignmentCoverageDto
    public let discovery: CallHealthDashboardDiscoveryCoverageDto
    public let sweep: CallHealthDashboardSweepCoverageDto
    /// Completeness of received authorized work only; never source delivery coverage.
    public let countsComplete: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        asOf: Date,
        intake: CallHealthDashboardIntakeCoverageDto,
        goal: CallHealthDashboardGoalGapsDto,
        classification: CallHealthDashboardClassificationCoverageDto,
        assignment: CallHealthDashboardAssignmentCoverageDto,
        discovery: CallHealthDashboardDiscoveryCoverageDto,
        sweep: CallHealthDashboardSweepCoverageDto,
        countsComplete: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.asOf = asOf
        self.intake = intake
        self.goal = goal
        self.classification = classification
        self.assignment = assignment
        self.discovery = discovery
        self.sweep = sweep
        self.countsComplete = countsComplete
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.asOf = try container.decode(Date.self, forKey: .asOf)
        self.intake = try container.decode(CallHealthDashboardIntakeCoverageDto.self, forKey: .intake)
        self.goal = try container.decode(CallHealthDashboardGoalGapsDto.self, forKey: .goal)
        self.classification = try container.decode(CallHealthDashboardClassificationCoverageDto.self, forKey: .classification)
        self.assignment = try container.decode(CallHealthDashboardAssignmentCoverageDto.self, forKey: .assignment)
        self.discovery = try container.decode(CallHealthDashboardDiscoveryCoverageDto.self, forKey: .discovery)
        self.sweep = try container.decode(CallHealthDashboardSweepCoverageDto.self, forKey: .sweep)
        self.countsComplete = try container.decode(Bool.self, forKey: .countsComplete)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.asOf, forKey: .asOf)
        try container.encode(self.intake, forKey: .intake)
        try container.encode(self.goal, forKey: .goal)
        try container.encode(self.classification, forKey: .classification)
        try container.encode(self.assignment, forKey: .assignment)
        try container.encode(self.discovery, forKey: .discovery)
        try container.encode(self.sweep, forKey: .sweep)
        try container.encode(self.countsComplete, forKey: .countsComplete)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case asOf
        case intake
        case goal
        case classification
        case assignment
        case discovery
        case sweep
        case countsComplete
    }
}