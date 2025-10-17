import Foundation

public struct ServerMessageEndOfCallReport: Codable, Hashable, Sendable {
    /// This is the phone number that the message is associated with.
    public let phoneNumber: ServerMessageEndOfCallReportPhoneNumber?
    /// This is the type of the message. "end-of-call-report" is sent when the call ends and post-processing is complete.
    public let type: EndOfCallReport
    /// This is the reason the call ended. This can also be found at `call.endedReason` on GET /call/:id.
    public let endedReason: ServerMessageEndOfCallReportEndedReason
    /// This is the cost of the call in USD. This can also be found at `call.cost` on GET /call/:id.
    public let cost: Double?
    /// These are the costs of individual components of the call in USD. This can also be found at `call.costs` on GET /call/:id.
    public let costs: [ServerMessageEndOfCallReportCostsItem]?
    /// This is the timestamp of the message.
    public let timestamp: Double?
    /// These are the artifacts from the call. This can also be found at `call.artifact` on GET /call/:id.
    public let artifact: Artifact
    /// This is the assistant that the message is associated with.
    public let assistant: CreateAssistantDto?
    /// This is the customer that the message is associated with.
    public let customer: CreateCustomerDto?
    /// This is the call that the message is associated with.
    public let call: Call?
    /// This is the chat object.
    public let chat: Chat?
    /// This is the analysis of the call. This can also be found at `call.analysis` on GET /call/:id.
    public let analysis: Analysis
    /// This is the ISO 8601 date-time string of when the call started. This can also be found at `call.startedAt` on GET /call/:id.
    public let startedAt: Date?
    /// This is the ISO 8601 date-time string of when the call ended. This can also be found at `call.endedAt` on GET /call/:id.
    public let endedAt: Date?
    /// This is the compliance result of the call. This can also be found at `call.compliance` on GET /call/:id.
    public let compliance: Compliance?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        phoneNumber: ServerMessageEndOfCallReportPhoneNumber? = nil,
        type: EndOfCallReport,
        endedReason: ServerMessageEndOfCallReportEndedReason,
        cost: Double? = nil,
        costs: [ServerMessageEndOfCallReportCostsItem]? = nil,
        timestamp: Double? = nil,
        artifact: Artifact,
        assistant: CreateAssistantDto? = nil,
        customer: CreateCustomerDto? = nil,
        call: Call? = nil,
        chat: Chat? = nil,
        analysis: Analysis,
        startedAt: Date? = nil,
        endedAt: Date? = nil,
        compliance: Compliance? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.phoneNumber = phoneNumber
        self.type = type
        self.endedReason = endedReason
        self.cost = cost
        self.costs = costs
        self.timestamp = timestamp
        self.artifact = artifact
        self.assistant = assistant
        self.customer = customer
        self.call = call
        self.chat = chat
        self.analysis = analysis
        self.startedAt = startedAt
        self.endedAt = endedAt
        self.compliance = compliance
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.phoneNumber = try container.decodeIfPresent(ServerMessageEndOfCallReportPhoneNumber.self, forKey: .phoneNumber)
        self.type = try container.decode(EndOfCallReport.self, forKey: .type)
        self.endedReason = try container.decode(ServerMessageEndOfCallReportEndedReason.self, forKey: .endedReason)
        self.cost = try container.decodeIfPresent(Double.self, forKey: .cost)
        self.costs = try container.decodeIfPresent([ServerMessageEndOfCallReportCostsItem].self, forKey: .costs)
        self.timestamp = try container.decodeIfPresent(Double.self, forKey: .timestamp)
        self.artifact = try container.decode(Artifact.self, forKey: .artifact)
        self.assistant = try container.decodeIfPresent(CreateAssistantDto.self, forKey: .assistant)
        self.customer = try container.decodeIfPresent(CreateCustomerDto.self, forKey: .customer)
        self.call = try container.decodeIfPresent(Call.self, forKey: .call)
        self.chat = try container.decodeIfPresent(Chat.self, forKey: .chat)
        self.analysis = try container.decode(Analysis.self, forKey: .analysis)
        self.startedAt = try container.decodeIfPresent(Date.self, forKey: .startedAt)
        self.endedAt = try container.decodeIfPresent(Date.self, forKey: .endedAt)
        self.compliance = try container.decodeIfPresent(Compliance.self, forKey: .compliance)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.phoneNumber, forKey: .phoneNumber)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.endedReason, forKey: .endedReason)
        try container.encodeIfPresent(self.cost, forKey: .cost)
        try container.encodeIfPresent(self.costs, forKey: .costs)
        try container.encodeIfPresent(self.timestamp, forKey: .timestamp)
        try container.encode(self.artifact, forKey: .artifact)
        try container.encodeIfPresent(self.assistant, forKey: .assistant)
        try container.encodeIfPresent(self.customer, forKey: .customer)
        try container.encodeIfPresent(self.call, forKey: .call)
        try container.encodeIfPresent(self.chat, forKey: .chat)
        try container.encode(self.analysis, forKey: .analysis)
        try container.encodeIfPresent(self.startedAt, forKey: .startedAt)
        try container.encodeIfPresent(self.endedAt, forKey: .endedAt)
        try container.encodeIfPresent(self.compliance, forKey: .compliance)
    }

    public enum EndOfCallReport: String, Codable, Hashable, CaseIterable, Sendable {
        case endOfCallReport = "end-of-call-report"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case phoneNumber
        case type
        case endedReason
        case cost
        case costs
        case timestamp
        case artifact
        case assistant
        case customer
        case call
        case chat
        case analysis
        case startedAt
        case endedAt
        case compliance
    }
}