import Foundation

extension Requests {
    public struct CreateSimulationSuiteDto: Codable, Hashable, Sendable {
        /// The display name of the suite.
        public let name: String
        /// A Slack incoming-webhook URL notified when the suite runs.
        public let slackWebhookUrl: String?
        /// The IDs of the simulations included in the suite.
        public let simulationIds: [String]
        /// The assistants or squads the suite's simulations run against.
        public let targetAssignments: [SimulationSuiteTargetAssignment]?
        /// Optional folder path for organizing simulation suites.
        /// Supports up to 3 levels (e.g., "dept/feature/variant").
        /// Maps to GitOps resource folder structure.
        public let path: Nullable<String>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            name: String,
            slackWebhookUrl: String? = nil,
            simulationIds: [String],
            targetAssignments: [SimulationSuiteTargetAssignment]? = nil,
            path: Nullable<String>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.name = name
            self.slackWebhookUrl = slackWebhookUrl
            self.simulationIds = simulationIds
            self.targetAssignments = targetAssignments
            self.path = path
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.name = try container.decode(String.self, forKey: .name)
            self.slackWebhookUrl = try container.decodeIfPresent(String.self, forKey: .slackWebhookUrl)
            self.simulationIds = try container.decode([String].self, forKey: .simulationIds)
            self.targetAssignments = try container.decodeIfPresent([SimulationSuiteTargetAssignment].self, forKey: .targetAssignments)
            self.path = try container.decodeNullableIfPresent(String.self, forKey: .path)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.name, forKey: .name)
            try container.encodeIfPresent(self.slackWebhookUrl, forKey: .slackWebhookUrl)
            try container.encode(self.simulationIds, forKey: .simulationIds)
            try container.encodeIfPresent(self.targetAssignments, forKey: .targetAssignments)
            try container.encodeNullableIfPresent(self.path, forKey: .path)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case name
            case slackWebhookUrl
            case simulationIds
            case targetAssignments
            case path
        }
    }
}