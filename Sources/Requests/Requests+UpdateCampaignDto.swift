import Foundation

extension Requests {
    public struct UpdateCampaignDto: Codable, Hashable, Sendable {
        /// This is the name of the campaign. This is just for your own reference.
        public let name: String?
        /// This is the assistant ID that will be used for the campaign calls.
        /// Can only be updated if campaign is not in progress or has ended.
        public let assistantId: String?
        /// This is the workflow ID that will be used for the campaign calls.
        /// Can only be updated if campaign is not in progress or has ended.
        public let workflowId: String?
        /// This is the phone number ID that will be used for the campaign calls.
        /// Can only be updated if campaign is not in progress or has ended.
        public let phoneNumberId: String?
        /// This is the schedule plan for the campaign.
        /// Can only be updated if campaign is not in progress or has ended.
        public let schedulePlan: SchedulePlan?
        /// This is the status of the campaign.
        /// Can only be updated to 'ended' if you want to end the campaign.
        /// When set to 'ended', it will delete all scheduled calls. Calls in progress will be allowed to complete.
        public let status: Ended?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            name: String? = nil,
            assistantId: String? = nil,
            workflowId: String? = nil,
            phoneNumberId: String? = nil,
            schedulePlan: SchedulePlan? = nil,
            status: Ended? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.name = name
            self.assistantId = assistantId
            self.workflowId = workflowId
            self.phoneNumberId = phoneNumberId
            self.schedulePlan = schedulePlan
            self.status = status
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
            self.workflowId = try container.decodeIfPresent(String.self, forKey: .workflowId)
            self.phoneNumberId = try container.decodeIfPresent(String.self, forKey: .phoneNumberId)
            self.schedulePlan = try container.decodeIfPresent(SchedulePlan.self, forKey: .schedulePlan)
            self.status = try container.decodeIfPresent(Ended.self, forKey: .status)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.name, forKey: .name)
            try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
            try container.encodeIfPresent(self.workflowId, forKey: .workflowId)
            try container.encodeIfPresent(self.phoneNumberId, forKey: .phoneNumberId)
            try container.encodeIfPresent(self.schedulePlan, forKey: .schedulePlan)
            try container.encodeIfPresent(self.status, forKey: .status)
        }

        public enum Ended: String, Codable, Hashable, CaseIterable, Sendable {
            case ended
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case name
            case assistantId
            case workflowId
            case phoneNumberId
            case schedulePlan
            case status
        }
    }
}