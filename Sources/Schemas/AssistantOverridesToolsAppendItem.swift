import Foundation

public indirect enum AssistantOverridesToolsAppendItem: Codable, Hashable, Sendable {
    case apiRequest(CreateApiRequestToolDto)
    case bash(CreateBashToolDto)
    case code(CreateCodeToolDto)
    case computer(CreateComputerToolDto)
    case dtmf(CreateDtmfToolDto)
    case endCall(CreateEndCallToolDto)
    case function(CreateFunctionToolDto)
    case gohighlevelCalendarAvailabilityCheck(CreateGoHighLevelCalendarAvailabilityToolDto)
    case gohighlevelCalendarEventCreate(CreateGoHighLevelCalendarEventCreateToolDto)
    case gohighlevelContactCreate(CreateGoHighLevelContactCreateToolDto)
    case gohighlevelContactGet(CreateGoHighLevelContactGetToolDto)
    case googleCalendarAvailabilityCheck(CreateGoogleCalendarCheckAvailabilityToolDto)
    case googleCalendarEventCreate(CreateGoogleCalendarCreateEventToolDto)
    case googleSheetsRowAppend(CreateGoogleSheetsRowAppendToolDto)
    case handoff(CreateHandoffToolDto)
    case mcp(CreateMcpToolDto)
    case query(CreateQueryToolDto)
    case sipRequest(CreateSipRequestToolDto)
    case slackMessageSend(CreateSlackSendMessageToolDto)
    case sms(CreateSmsToolDto)
    case textEditor(CreateTextEditorToolDto)
    case transferCall(CreateTransferCallToolDto)
    case voicemail(CreateVoicemailToolDto)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "apiRequest":
            self = .apiRequest(try CreateApiRequestToolDto(from: decoder))
        case "bash":
            self = .bash(try CreateBashToolDto(from: decoder))
        case "code":
            self = .code(try CreateCodeToolDto(from: decoder))
        case "computer":
            self = .computer(try CreateComputerToolDto(from: decoder))
        case "dtmf":
            self = .dtmf(try CreateDtmfToolDto(from: decoder))
        case "endCall":
            self = .endCall(try CreateEndCallToolDto(from: decoder))
        case "function":
            self = .function(try CreateFunctionToolDto(from: decoder))
        case "gohighlevel.calendar.availability.check":
            self = .gohighlevelCalendarAvailabilityCheck(try CreateGoHighLevelCalendarAvailabilityToolDto(from: decoder))
        case "gohighlevel.calendar.event.create":
            self = .gohighlevelCalendarEventCreate(try CreateGoHighLevelCalendarEventCreateToolDto(from: decoder))
        case "gohighlevel.contact.create":
            self = .gohighlevelContactCreate(try CreateGoHighLevelContactCreateToolDto(from: decoder))
        case "gohighlevel.contact.get":
            self = .gohighlevelContactGet(try CreateGoHighLevelContactGetToolDto(from: decoder))
        case "google.calendar.availability.check":
            self = .googleCalendarAvailabilityCheck(try CreateGoogleCalendarCheckAvailabilityToolDto(from: decoder))
        case "google.calendar.event.create":
            self = .googleCalendarEventCreate(try CreateGoogleCalendarCreateEventToolDto(from: decoder))
        case "google.sheets.row.append":
            self = .googleSheetsRowAppend(try CreateGoogleSheetsRowAppendToolDto(from: decoder))
        case "handoff":
            self = .handoff(try CreateHandoffToolDto(from: decoder))
        case "mcp":
            self = .mcp(try CreateMcpToolDto(from: decoder))
        case "query":
            self = .query(try CreateQueryToolDto(from: decoder))
        case "sipRequest":
            self = .sipRequest(try CreateSipRequestToolDto(from: decoder))
        case "slack.message.send":
            self = .slackMessageSend(try CreateSlackSendMessageToolDto(from: decoder))
        case "sms":
            self = .sms(try CreateSmsToolDto(from: decoder))
        case "textEditor":
            self = .textEditor(try CreateTextEditorToolDto(from: decoder))
        case "transferCall":
            self = .transferCall(try CreateTransferCallToolDto(from: decoder))
        case "voicemail":
            self = .voicemail(try CreateVoicemailToolDto(from: decoder))
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unknown shape discriminant value: \(discriminant)"
                )
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .apiRequest(let data):
            try container.encode("apiRequest", forKey: .type)
            try data.encode(to: encoder)
        case .bash(let data):
            try container.encode("bash", forKey: .type)
            try data.encode(to: encoder)
        case .code(let data):
            try container.encode("code", forKey: .type)
            try data.encode(to: encoder)
        case .computer(let data):
            try container.encode("computer", forKey: .type)
            try data.encode(to: encoder)
        case .dtmf(let data):
            try container.encode("dtmf", forKey: .type)
            try data.encode(to: encoder)
        case .endCall(let data):
            try container.encode("endCall", forKey: .type)
            try data.encode(to: encoder)
        case .function(let data):
            try container.encode("function", forKey: .type)
            try data.encode(to: encoder)
        case .gohighlevelCalendarAvailabilityCheck(let data):
            try container.encode("gohighlevel.calendar.availability.check", forKey: .type)
            try data.encode(to: encoder)
        case .gohighlevelCalendarEventCreate(let data):
            try container.encode("gohighlevel.calendar.event.create", forKey: .type)
            try data.encode(to: encoder)
        case .gohighlevelContactCreate(let data):
            try container.encode("gohighlevel.contact.create", forKey: .type)
            try data.encode(to: encoder)
        case .gohighlevelContactGet(let data):
            try container.encode("gohighlevel.contact.get", forKey: .type)
            try data.encode(to: encoder)
        case .googleCalendarAvailabilityCheck(let data):
            try container.encode("google.calendar.availability.check", forKey: .type)
            try data.encode(to: encoder)
        case .googleCalendarEventCreate(let data):
            try container.encode("google.calendar.event.create", forKey: .type)
            try data.encode(to: encoder)
        case .googleSheetsRowAppend(let data):
            try container.encode("google.sheets.row.append", forKey: .type)
            try data.encode(to: encoder)
        case .handoff(let data):
            try container.encode("handoff", forKey: .type)
            try data.encode(to: encoder)
        case .mcp(let data):
            try container.encode("mcp", forKey: .type)
            try data.encode(to: encoder)
        case .query(let data):
            try container.encode("query", forKey: .type)
            try data.encode(to: encoder)
        case .sipRequest(let data):
            try container.encode("sipRequest", forKey: .type)
            try data.encode(to: encoder)
        case .slackMessageSend(let data):
            try container.encode("slack.message.send", forKey: .type)
            try data.encode(to: encoder)
        case .sms(let data):
            try container.encode("sms", forKey: .type)
            try data.encode(to: encoder)
        case .textEditor(let data):
            try container.encode("textEditor", forKey: .type)
            try data.encode(to: encoder)
        case .transferCall(let data):
            try container.encode("transferCall", forKey: .type)
            try data.encode(to: encoder)
        case .voicemail(let data):
            try container.encode("voicemail", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}