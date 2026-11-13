import Foundation

extension Requests {
    public struct SimulationOnboardingSuiteUpdateDto: Codable, Hashable, Sendable {
        /// A new key for each edit. Replaying an applied key changes nothing and returns the current suite. A suite remembers its last 50 keys, so never reuse one.
        public let patchKey: String
        /// Simulations to take out of the suite. They are unlinked, not deleted.
        public let removeSimulationIds: [String]?
        /// Simulations to rewrite in place, at most one edit per simulation: put every change for a simulation in one instruction.
        public let edits: [SimulationOnboardingSuiteEditDto]?
        /// Regenerate the scenarios that failed or did not fit when the suite was generated.
        public let retryFailed: Bool?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            patchKey: String,
            removeSimulationIds: [String]? = nil,
            edits: [SimulationOnboardingSuiteEditDto]? = nil,
            retryFailed: Bool? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.patchKey = patchKey
            self.removeSimulationIds = removeSimulationIds
            self.edits = edits
            self.retryFailed = retryFailed
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.patchKey = try container.decode(String.self, forKey: .patchKey)
            self.removeSimulationIds = try container.decodeIfPresent([String].self, forKey: .removeSimulationIds)
            self.edits = try container.decodeIfPresent([SimulationOnboardingSuiteEditDto].self, forKey: .edits)
            self.retryFailed = try container.decodeIfPresent(Bool.self, forKey: .retryFailed)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.patchKey, forKey: .patchKey)
            try container.encodeIfPresent(self.removeSimulationIds, forKey: .removeSimulationIds)
            try container.encodeIfPresent(self.edits, forKey: .edits)
            try container.encodeIfPresent(self.retryFailed, forKey: .retryFailed)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case patchKey
            case removeSimulationIds
            case edits
            case retryFailed
        }
    }
}