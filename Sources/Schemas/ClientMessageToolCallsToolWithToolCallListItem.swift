import Foundation

public enum ClientMessageToolCallsToolWithToolCallListItem: Codable, Hashable, Sendable {
    case bash(BashToolWithToolCall)
    case computer(ComputerToolWithToolCall)
    case function(FunctionToolWithToolCall)
    case ghl(GhlToolWithToolCall)
    case googleCalendarEventCreate(GoogleCalendarCreateEventToolWithToolCall)
    case make(MakeToolWithToolCall)
    case textEditor(TextEditorToolWithToolCall)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "bash":
            self = .bash(try BashToolWithToolCall(from: decoder))
        case "computer":
            self = .computer(try ComputerToolWithToolCall(from: decoder))
        case "function":
            self = .function(try FunctionToolWithToolCall(from: decoder))
        case "ghl":
            self = .ghl(try GhlToolWithToolCall(from: decoder))
        case "google.calendar.event.create":
            self = .googleCalendarEventCreate(try GoogleCalendarCreateEventToolWithToolCall(from: decoder))
        case "make":
            self = .make(try MakeToolWithToolCall(from: decoder))
        case "textEditor":
            self = .textEditor(try TextEditorToolWithToolCall(from: decoder))
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
        case .bash(let data):
            try container.encode("bash", forKey: .type)
            try data.encode(to: encoder)
        case .computer(let data):
            try container.encode("computer", forKey: .type)
            try data.encode(to: encoder)
        case .function(let data):
            try container.encode("function", forKey: .type)
            try data.encode(to: encoder)
        case .ghl(let data):
            try container.encode("ghl", forKey: .type)
            try data.encode(to: encoder)
        case .googleCalendarEventCreate(let data):
            try container.encode("google.calendar.event.create", forKey: .type)
            try data.encode(to: encoder)
        case .make(let data):
            try container.encode("make", forKey: .type)
            try data.encode(to: encoder)
        case .textEditor(let data):
            try container.encode("textEditor", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}