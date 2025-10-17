import Foundation

extension Requests {
    public struct CreateCampaignDto: Codable, Hashable, Sendable {
        /// This is the name of the campaign. This is just for your own reference.
        public let name: String
        /// This is the assistant ID that will be used for the campaign calls. Note: Either assistantId or workflowId can be used, but not both.
        public let assistantId: String?
        /// This is the workflow ID that will be used for the campaign calls. Note: Either assistantId or workflowId can be used, but not both.
        public let workflowId: String?
        /// This is the phone number ID that will be used for the campaign calls.
        public let phoneNumberId: String
        /// This is the schedule plan for the campaign.
        public let schedulePlan: SchedulePlan?
        /// These are the customers that will be called in the campaign.
        public let customers: [CreateCustomerDto]
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            name: String,
            assistantId: String? = nil,
            workflowId: String? = nil,
            phoneNumberId: String,
            schedulePlan: SchedulePlan? = nil,
            customers: [CreateCustomerDto],
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.name = name
            self.assistantId = assistantId
            self.workflowId = workflowId
            self.phoneNumberId = phoneNumberId
            self.schedulePlan = schedulePlan
            self.customers = customers
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.name = try container.decode(String.self, forKey: .name)
            self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
            self.workflowId = try container.decodeIfPresent(String.self, forKey: .workflowId)
            self.phoneNumberId = try container.decode(String.self, forKey: .phoneNumberId)
            self.schedulePlan = try container.decodeIfPresent(SchedulePlan.self, forKey: .schedulePlan)
            self.customers = try container.decode([CreateCustomerDto].self, forKey: .customers)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.name, forKey: .name)
            try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
            try container.encodeIfPresent(self.workflowId, forKey: .workflowId)
            try container.encode(self.phoneNumberId, forKey: .phoneNumberId)
            try container.encodeIfPresent(self.schedulePlan, forKey: .schedulePlan)
            try container.encode(self.customers, forKey: .customers)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case name
            case assistantId
            case workflowId
            case phoneNumberId
            case schedulePlan
            case customers
        }
    }
}