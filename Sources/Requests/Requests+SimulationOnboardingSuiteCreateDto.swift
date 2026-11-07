import Foundation

extension Requests {
    public struct SimulationOnboardingSuiteCreateDto: Codable, Hashable, Sendable {
        /// Assistant the suite tests and is assigned to.
        public let assistantId: String
        /// A unique key for this suite generation request. Retrying with the same key returns the saved suite, or a 409 while generation is in progress. Use a new key for a different assistant or requirements.
        public let idempotencyKey: String
        /// The reviewed test requirements to generate simulations for, from the requirements draft. Each requirement must have a unique id.
        public let requirements: [SimulationOnboardingRequirementDto]
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            assistantId: String,
            idempotencyKey: String,
            requirements: [SimulationOnboardingRequirementDto],
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.assistantId = assistantId
            self.idempotencyKey = idempotencyKey
            self.requirements = requirements
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.assistantId = try container.decode(String.self, forKey: .assistantId)
            self.idempotencyKey = try container.decode(String.self, forKey: .idempotencyKey)
            self.requirements = try container.decode([SimulationOnboardingRequirementDto].self, forKey: .requirements)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.assistantId, forKey: .assistantId)
            try container.encode(self.idempotencyKey, forKey: .idempotencyKey)
            try container.encode(self.requirements, forKey: .requirements)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case assistantId
            case idempotencyKey
            case requirements
        }
    }
}