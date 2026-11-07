import Foundation

public struct SimulationOnboardingRequirementsDraftDto: Codable, Hashable, Sendable {
    /// Draft version, 1 for a first draft.
    public let version: Double
    /// What changed since the previous draft.
    public let changeNote: String?
    /// What the draft was based on, e.g. the prompt and tools.
    public let sources: [String]
    /// Draft test requirements describing the expected assistant behavior. Review and refine these before generating a simulation suite.
    public let requirements: [SimulationOnboardingRequirementDto]
    /// Questions about ambiguous or missing assistant behavior to resolve before generating a simulation suite.
    public let openQuestions: [SimulationOnboardingOpenQuestionDto]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        version: Double,
        changeNote: String? = nil,
        sources: [String],
        requirements: [SimulationOnboardingRequirementDto],
        openQuestions: [SimulationOnboardingOpenQuestionDto],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.version = version
        self.changeNote = changeNote
        self.sources = sources
        self.requirements = requirements
        self.openQuestions = openQuestions
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.version = try container.decode(Double.self, forKey: .version)
        self.changeNote = try container.decodeIfPresent(String.self, forKey: .changeNote)
        self.sources = try container.decode([String].self, forKey: .sources)
        self.requirements = try container.decode([SimulationOnboardingRequirementDto].self, forKey: .requirements)
        self.openQuestions = try container.decode([SimulationOnboardingOpenQuestionDto].self, forKey: .openQuestions)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.version, forKey: .version)
        try container.encodeIfPresent(self.changeNote, forKey: .changeNote)
        try container.encode(self.sources, forKey: .sources)
        try container.encode(self.requirements, forKey: .requirements)
        try container.encode(self.openQuestions, forKey: .openQuestions)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case version
        case changeNote
        case sources
        case requirements
        case openQuestions
    }
}