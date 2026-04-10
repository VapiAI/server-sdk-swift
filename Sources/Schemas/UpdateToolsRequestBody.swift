import Foundation

public enum UpdateToolsRequestBody: Codable, Hashable, Sendable {
    case apiRequest(UpdateApiRequestToolDto)
    case bash(UpdateBashToolDto)
    case computer(UpdateComputerToolDto)
    case dtmf(UpdateDtmfToolDto)
    case endCall(UpdateEndCallToolDto)
    case function(UpdateFunctionToolDto)
    case gohighlevelCalendarAvailabilityCheck(UpdateGoHighLevelCalendarAvailabilityToolDto)
    case gohighlevelCalendarEventCreate(UpdateGoHighLevelCalendarEventCreateToolDto)
    case gohighlevelContactCreate(UpdateGoHighLevelContactCreateToolDto)
    case gohighlevelContactGet(UpdateGoHighLevelContactGetToolDto)
    case googleCalendarAvailabilityCheck(UpdateGoogleCalendarCheckAvailabilityToolDto)
    case googleCalendarEventCreate(UpdateGoogleCalendarCreateEventToolDto)
    case googleSheetsRowAppend(UpdateGoogleSheetsRowAppendToolDto)
    case handoff(UpdateHandoffToolDto)
    case mcp(UpdateMcpToolDto)
    case query(UpdateQueryToolDto)
    case sipRequest(UpdateSipRequestToolDto)
    case slackMessageSend(UpdateSlackSendMessageToolDto)
    case sms(UpdateSmsToolDto)
    case textEditor(UpdateTextEditorToolDto)
    case transferCall(UpdateTransferCallToolDto)
    case voicemail(UpdateVoicemailToolDto)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "apiRequest":
            self = .apiRequest(try UpdateApiRequestToolDto(from: decoder))
        case "bash":
            self = .bash(try UpdateBashToolDto(from: decoder))
        case "computer":
            self = .computer(try UpdateComputerToolDto(from: decoder))
        case "dtmf":
            self = .dtmf(try UpdateDtmfToolDto(from: decoder))
        case "endCall":
            self = .endCall(try UpdateEndCallToolDto(from: decoder))
        case "function":
            self = .function(try UpdateFunctionToolDto(from: decoder))
        case "gohighlevel.calendar.availability.check":
            self = .gohighlevelCalendarAvailabilityCheck(try UpdateGoHighLevelCalendarAvailabilityToolDto(from: decoder))
        case "gohighlevel.calendar.event.create":
            self = .gohighlevelCalendarEventCreate(try UpdateGoHighLevelCalendarEventCreateToolDto(from: decoder))
        case "gohighlevel.contact.create":
            self = .gohighlevelContactCreate(try UpdateGoHighLevelContactCreateToolDto(from: decoder))
        case "gohighlevel.contact.get":
            self = .gohighlevelContactGet(try UpdateGoHighLevelContactGetToolDto(from: decoder))
        case "google.calendar.availability.check":
            self = .googleCalendarAvailabilityCheck(try UpdateGoogleCalendarCheckAvailabilityToolDto(from: decoder))
        case "google.calendar.event.create":
            self = .googleCalendarEventCreate(try UpdateGoogleCalendarCreateEventToolDto(from: decoder))
        case "google.sheets.row.append":
            self = .googleSheetsRowAppend(try UpdateGoogleSheetsRowAppendToolDto(from: decoder))
        case "handoff":
            self = .handoff(try UpdateHandoffToolDto(from: decoder))
        case "mcp":
            self = .mcp(try UpdateMcpToolDto(from: decoder))
        case "query":
            self = .query(try UpdateQueryToolDto(from: decoder))
        case "sipRequest":
            self = .sipRequest(try UpdateSipRequestToolDto(from: decoder))
        case "slack.message.send":
            self = .slackMessageSend(try UpdateSlackSendMessageToolDto(from: decoder))
        case "sms":
            self = .sms(try UpdateSmsToolDto(from: decoder))
        case "textEditor":
            self = .textEditor(try UpdateTextEditorToolDto(from: decoder))
        case "transferCall":
            self = .transferCall(try UpdateTransferCallToolDto(from: decoder))
        case "voicemail":
            self = .voicemail(try UpdateVoicemailToolDto(from: decoder))
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