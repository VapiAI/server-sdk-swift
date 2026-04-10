import Foundation

public enum ListToolsResponseItem: Codable, Hashable, Sendable {
    case apiRequest(ApiRequestTool)
    case bash(BashTool)
    case code(CodeTool)
    case computer(ComputerTool)
    case dtmf(DtmfTool)
    case endCall(EndCallTool)
    case function(FunctionTool)
    case gohighlevelCalendarAvailabilityCheck(GoHighLevelCalendarAvailabilityTool)
    case gohighlevelCalendarEventCreate(GoHighLevelCalendarEventCreateTool)
    case gohighlevelContactCreate(GoHighLevelContactCreateTool)
    case gohighlevelContactGet(GoHighLevelContactGetTool)
    case googleCalendarAvailabilityCheck(GoogleCalendarCheckAvailabilityTool)
    case googleCalendarEventCreate(GoogleCalendarCreateEventTool)
    case googleSheetsRowAppend(GoogleSheetsRowAppendTool)
    case handoff(HandoffTool)
    case mcp(McpTool)
    case query(QueryTool)
    case sipRequest(SipRequestTool)
    case slackMessageSend(SlackSendMessageTool)
    case sms(SmsTool)
    case textEditor(TextEditorTool)
    case transferCall(TransferCallTool)
    case voicemail(VoicemailTool)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "apiRequest":
            self = .apiRequest(try ApiRequestTool(from: decoder))
        case "bash":
            self = .bash(try BashTool(from: decoder))
        case "code":
            self = .code(try CodeTool(from: decoder))
        case "computer":
            self = .computer(try ComputerTool(from: decoder))
        case "dtmf":
            self = .dtmf(try DtmfTool(from: decoder))
        case "endCall":
            self = .endCall(try EndCallTool(from: decoder))
        case "function":
            self = .function(try FunctionTool(from: decoder))
        case "gohighlevel.calendar.availability.check":
            self = .gohighlevelCalendarAvailabilityCheck(try GoHighLevelCalendarAvailabilityTool(from: decoder))
        case "gohighlevel.calendar.event.create":
            self = .gohighlevelCalendarEventCreate(try GoHighLevelCalendarEventCreateTool(from: decoder))
        case "gohighlevel.contact.create":
            self = .gohighlevelContactCreate(try GoHighLevelContactCreateTool(from: decoder))
        case "gohighlevel.contact.get":
            self = .gohighlevelContactGet(try GoHighLevelContactGetTool(from: decoder))
        case "google.calendar.availability.check":
            self = .googleCalendarAvailabilityCheck(try GoogleCalendarCheckAvailabilityTool(from: decoder))
        case "google.calendar.event.create":
            self = .googleCalendarEventCreate(try GoogleCalendarCreateEventTool(from: decoder))
        case "google.sheets.row.append":
            self = .googleSheetsRowAppend(try GoogleSheetsRowAppendTool(from: decoder))
        case "handoff":
            self = .handoff(try HandoffTool(from: decoder))
        case "mcp":
            self = .mcp(try McpTool(from: decoder))
        case "query":
            self = .query(try QueryTool(from: decoder))
        case "sipRequest":
            self = .sipRequest(try SipRequestTool(from: decoder))
        case "slack.message.send":
            self = .slackMessageSend(try SlackSendMessageTool(from: decoder))
        case "sms":
            self = .sms(try SmsTool(from: decoder))
        case "textEditor":
            self = .textEditor(try TextEditorTool(from: decoder))
        case "transferCall":
            self = .transferCall(try TransferCallTool(from: decoder))
        case "voicemail":
            self = .voicemail(try VoicemailTool(from: decoder))
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