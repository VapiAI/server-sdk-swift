import Foundation

public struct SimulationOnboardingRequirementDto: Codable, Hashable, Sendable {
    /// Stable requirement id, e.g. `R3`.
    public let id: String
    /// One observable behaviour the assistant must get right.
    public let text: String
    /// Indicates an assumption, a requirement that needs a voice simulation, or a requirement that cannot be tested.
    public let tag: SimulationOnboardingRequirementDtoTag?
    /// What was assumed, why only a voice run can check it, or why it cannot be tested.
    public let note: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        text: String,
        tag: SimulationOnboardingRequirementDtoTag? = nil,
        note: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.text = text
        self.tag = tag
        self.note = note
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.text = try container.decode(String.self, forKey: .text)
        self.tag = try container.decodeIfPresent(SimulationOnboardingRequirementDtoTag.self, forKey: .tag)
        self.note = try container.decodeIfPresent(String.self, forKey: .note)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.text, forKey: .text)
        try container.encodeIfPresent(self.tag, forKey: .tag)
        try container.encodeIfPresent(self.note, forKey: .note)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case text
        case tag
        case note
    }
}