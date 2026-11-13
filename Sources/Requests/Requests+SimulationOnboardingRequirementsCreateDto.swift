import Foundation

extension Requests {
    public struct SimulationOnboardingRequirementsCreateDto: Codable, Hashable, Sendable {
        /// Assistant to draft requirements for.
        public let assistantId: String
        /// The draft being revised, exactly as this endpoint returned it. Send it with `feedback`.
        public let previousDraft: SimulationOnboardingRequirementsDraftDto?
        /// Natural-language instructions for revising the requirements in `previousDraft`, including answers to open questions. Required when `previousDraft` is provided.
        public let feedback: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            assistantId: String,
            previousDraft: SimulationOnboardingRequirementsDraftDto? = nil,
            feedback: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.assistantId = assistantId
            self.previousDraft = previousDraft
            self.feedback = feedback
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.assistantId = try container.decode(String.self, forKey: .assistantId)
            self.previousDraft = try container.decodeIfPresent(SimulationOnboardingRequirementsDraftDto.self, forKey: .previousDraft)
            self.feedback = try container.decodeIfPresent(String.self, forKey: .feedback)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.assistantId, forKey: .assistantId)
            try container.encodeIfPresent(self.previousDraft, forKey: .previousDraft)
            try container.encodeIfPresent(self.feedback, forKey: .feedback)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case assistantId
            case previousDraft
            case feedback
        }
    }
}