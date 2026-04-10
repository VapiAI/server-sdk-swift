import Foundation

extension Requests {
    public struct CreateCampaignDto: Codable, Hashable, Sendable {
        /// This is the name of the campaign. This is just for your own reference.
        public let name: String
        /// This is the assistant ID that will be used for the campaign calls. Note: Only one of assistantId, workflowId, or squadId can be used.
        public let assistantId: String?
        /// This is the workflow ID that will be used for the campaign calls. Note: Only one of assistantId, workflowId, or squadId can be used.
        public let workflowId: String?
        /// This is the squad ID that will be used for the campaign calls. Note: Only one of assistantId, workflowId, or squadId can be used.
        public let squadId: String?
        /// This is the phone number ID that will be used for the campaign calls. Required if dialPlan is not provided. Note: phoneNumberId and dialPlan are mutually exclusive.
        public let phoneNumberId: String?
        /// This is a list of dial entries, each specifying a phone number and the customers to call using that number. Use this when you want different phone numbers to call different sets of customers. Note: phoneNumberId and dialPlan are mutually exclusive.
        public let dialPlan: [DialPlanEntry]?
        /// This is the schedule plan for the campaign. Calls will start at startedAt and continue until your organization’s concurrency limit is reached. Any remaining calls will be retried for up to one hour as capacity becomes available. After that hour or after latestAt, whichever comes first, any calls that couldn’t be placed won’t be retried.
        public let schedulePlan: SchedulePlan?
        /// These are the customers that will be called in the campaign. Required if dialPlan is not provided.
        public let customers: [CreateCustomerDto]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            name: String,
            assistantId: String? = nil,
            workflowId: String? = nil,
            squadId: String? = nil,
            phoneNumberId: String? = nil,
            dialPlan: [DialPlanEntry]? = nil,
            schedulePlan: SchedulePlan? = nil,
            customers: [CreateCustomerDto]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.name = name
            self.assistantId = assistantId
            self.workflowId = workflowId
            self.squadId = squadId
            self.phoneNumberId = phoneNumberId
            self.dialPlan = dialPlan
            self.schedulePlan = schedulePlan
            self.customers = customers
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.name = try container.decode(String.self, forKey: .name)
            self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
            self.workflowId = try container.decodeIfPresent(String.self, forKey: .workflowId)
            self.squadId = try container.decodeIfPresent(String.self, forKey: .squadId)
            self.phoneNumberId = try container.decodeIfPresent(String.self, forKey: .phoneNumberId)
            self.dialPlan = try container.decodeIfPresent([DialPlanEntry].self, forKey: .dialPlan)
            self.schedulePlan = try container.decodeIfPresent(SchedulePlan.self, forKey: .schedulePlan)
            self.customers = try container.decodeIfPresent([CreateCustomerDto].self, forKey: .customers)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.name, forKey: .name)
            try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
            try container.encodeIfPresent(self.workflowId, forKey: .workflowId)
            try container.encodeIfPresent(self.squadId, forKey: .squadId)
            try container.encodeIfPresent(self.phoneNumberId, forKey: .phoneNumberId)
            try container.encodeIfPresent(self.dialPlan, forKey: .dialPlan)
            try container.encodeIfPresent(self.schedulePlan, forKey: .schedulePlan)
            try container.encodeIfPresent(self.customers, forKey: .customers)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case name
            case assistantId
            case workflowId
            case squadId
            case phoneNumberId
            case dialPlan
            case schedulePlan
            case customers
        }
    }
}