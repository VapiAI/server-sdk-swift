import Foundation

extension Requests {
    public struct CreateCallDto: Codable, Hashable, Sendable {
        /// This is used to issue batch calls to multiple customers.
        /// 
        /// Only relevant for `outboundPhoneCall`. To call a single customer, use `customer` instead.
        public let customers: [CreateCustomerDto]?
        /// This is the name of the call. This is just for your own reference.
        public let name: String?
        /// This is the schedule plan of the call.
        public let schedulePlan: SchedulePlan?
        /// This is the transport of the call.
        public let transport: [String: JSONValue]?
        /// This is the assistant ID that will be used for the call. To use a transient assistant, use `assistant` instead.
        /// 
        /// To start a call with:
        /// - Assistant, use `assistantId` or `assistant`
        /// - Squad, use `squadId` or `squad`
        /// - Workflow, use `workflowId` or `workflow`
        public let assistantId: String?
        /// This is the assistant that will be used for the call. To use an existing assistant, use `assistantId` instead.
        /// 
        /// To start a call with:
        /// - Assistant, use `assistant`
        /// - Squad, use `squad`
        /// - Workflow, use `workflow`
        public let assistant: CreateAssistantDto?
        /// These are the overrides for the `assistant` or `assistantId`'s settings and template variables.
        public let assistantOverrides: AssistantOverrides?
        /// This is the squad that will be used for the call. To use a transient squad, use `squad` instead.
        /// 
        /// To start a call with:
        /// - Assistant, use `assistant` or `assistantId`
        /// - Squad, use `squad` or `squadId`
        /// - Workflow, use `workflow` or `workflowId`
        public let squadId: String?
        /// This is a squad that will be used for the call. To use an existing squad, use `squadId` instead.
        /// 
        /// To start a call with:
        /// - Assistant, use `assistant` or `assistantId`
        /// - Squad, use `squad` or `squadId`
        /// - Workflow, use `workflow` or `workflowId`
        public let squad: CreateSquadDto?
        /// This is the workflow that will be used for the call. To use a transient workflow, use `workflow` instead.
        /// 
        /// To start a call with:
        /// - Assistant, use `assistant` or `assistantId`
        /// - Squad, use `squad` or `squadId`
        /// - Workflow, use `workflow` or `workflowId`
        public let workflowId: String?
        /// This is a workflow that will be used for the call. To use an existing workflow, use `workflowId` instead.
        /// 
        /// To start a call with:
        /// - Assistant, use `assistant` or `assistantId`
        /// - Squad, use `squad` or `squadId`
        /// - Workflow, use `workflow` or `workflowId`
        public let workflow: CreateWorkflowDto?
        /// These are the overrides for the `workflow` or `workflowId`'s settings and template variables.
        public let workflowOverrides: WorkflowOverrides?
        /// This is the phone number that will be used for the call. To use a transient number, use `phoneNumber` instead.
        /// 
        /// Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
        public let phoneNumberId: String?
        /// This is the phone number that will be used for the call. To use an existing number, use `phoneNumberId` instead.
        /// 
        /// Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
        public let phoneNumber: ImportTwilioPhoneNumberDto?
        /// This is the customer that will be called. To call a transient customer , use `customer` instead.
        /// 
        /// Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
        public let customerId: String?
        /// This is the customer that will be called. To call an existing customer, use `customerId` instead.
        /// 
        /// Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
        public let customer: CreateCustomerDto?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            customers: [CreateCustomerDto]? = nil,
            name: String? = nil,
            schedulePlan: SchedulePlan? = nil,
            transport: [String: JSONValue]? = nil,
            assistantId: String? = nil,
            assistant: CreateAssistantDto? = nil,
            assistantOverrides: AssistantOverrides? = nil,
            squadId: String? = nil,
            squad: CreateSquadDto? = nil,
            workflowId: String? = nil,
            workflow: CreateWorkflowDto? = nil,
            workflowOverrides: WorkflowOverrides? = nil,
            phoneNumberId: String? = nil,
            phoneNumber: ImportTwilioPhoneNumberDto? = nil,
            customerId: String? = nil,
            customer: CreateCustomerDto? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.customers = customers
            self.name = name
            self.schedulePlan = schedulePlan
            self.transport = transport
            self.assistantId = assistantId
            self.assistant = assistant
            self.assistantOverrides = assistantOverrides
            self.squadId = squadId
            self.squad = squad
            self.workflowId = workflowId
            self.workflow = workflow
            self.workflowOverrides = workflowOverrides
            self.phoneNumberId = phoneNumberId
            self.phoneNumber = phoneNumber
            self.customerId = customerId
            self.customer = customer
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.customers = try container.decodeIfPresent([CreateCustomerDto].self, forKey: .customers)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.schedulePlan = try container.decodeIfPresent(SchedulePlan.self, forKey: .schedulePlan)
            self.transport = try container.decodeIfPresent([String: JSONValue].self, forKey: .transport)
            self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
            self.assistant = try container.decodeIfPresent(CreateAssistantDto.self, forKey: .assistant)
            self.assistantOverrides = try container.decodeIfPresent(AssistantOverrides.self, forKey: .assistantOverrides)
            self.squadId = try container.decodeIfPresent(String.self, forKey: .squadId)
            self.squad = try container.decodeIfPresent(CreateSquadDto.self, forKey: .squad)
            self.workflowId = try container.decodeIfPresent(String.self, forKey: .workflowId)
            self.workflow = try container.decodeIfPresent(CreateWorkflowDto.self, forKey: .workflow)
            self.workflowOverrides = try container.decodeIfPresent(WorkflowOverrides.self, forKey: .workflowOverrides)
            self.phoneNumberId = try container.decodeIfPresent(String.self, forKey: .phoneNumberId)
            self.phoneNumber = try container.decodeIfPresent(ImportTwilioPhoneNumberDto.self, forKey: .phoneNumber)
            self.customerId = try container.decodeIfPresent(String.self, forKey: .customerId)
            self.customer = try container.decodeIfPresent(CreateCustomerDto.self, forKey: .customer)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.customers, forKey: .customers)
            try container.encodeIfPresent(self.name, forKey: .name)
            try container.encodeIfPresent(self.schedulePlan, forKey: .schedulePlan)
            try container.encodeIfPresent(self.transport, forKey: .transport)
            try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
            try container.encodeIfPresent(self.assistant, forKey: .assistant)
            try container.encodeIfPresent(self.assistantOverrides, forKey: .assistantOverrides)
            try container.encodeIfPresent(self.squadId, forKey: .squadId)
            try container.encodeIfPresent(self.squad, forKey: .squad)
            try container.encodeIfPresent(self.workflowId, forKey: .workflowId)
            try container.encodeIfPresent(self.workflow, forKey: .workflow)
            try container.encodeIfPresent(self.workflowOverrides, forKey: .workflowOverrides)
            try container.encodeIfPresent(self.phoneNumberId, forKey: .phoneNumberId)
            try container.encodeIfPresent(self.phoneNumber, forKey: .phoneNumber)
            try container.encodeIfPresent(self.customerId, forKey: .customerId)
            try container.encodeIfPresent(self.customer, forKey: .customer)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case customers
            case name
            case schedulePlan
            case transport
            case assistantId
            case assistant
            case assistantOverrides
            case squadId
            case squad
            case workflowId
            case workflow
            case workflowOverrides
            case phoneNumberId
            case phoneNumber
            case customerId
            case customer
        }
    }
}