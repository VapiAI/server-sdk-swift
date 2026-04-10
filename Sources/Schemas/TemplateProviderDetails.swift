import Foundation

public enum TemplateProviderDetails: Codable, Hashable, Sendable {
    case function(FunctionToolProviderDetails)
    case ghl(GhlToolProviderDetails)
    case gohighlevelCalendarAvailabilityCheck(GoHighLevelCalendarAvailabilityToolProviderDetails)
    case gohighlevelCalendarEventCreate(GoHighLevelCalendarEventCreateToolProviderDetails)
    case gohighlevelContactCreate(GoHighLevelContactCreateToolProviderDetails)
    case gohighlevelContactGet(GoHighLevelContactGetToolProviderDetails)
    case googleCalendarEventCreate(GoogleCalendarCreateEventToolProviderDetails)
    case googleSheetsRowAppend(GoogleSheetsRowAppendToolProviderDetails)
    case make(MakeToolProviderDetails)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "function":
            self = .function(try FunctionToolProviderDetails(from: decoder))
        case "ghl":
            self = .ghl(try GhlToolProviderDetails(from: decoder))
        case "gohighlevel.calendar.availability.check":
            self = .gohighlevelCalendarAvailabilityCheck(try GoHighLevelCalendarAvailabilityToolProviderDetails(from: decoder))
        case "gohighlevel.calendar.event.create":
            self = .gohighlevelCalendarEventCreate(try GoHighLevelCalendarEventCreateToolProviderDetails(from: decoder))
        case "gohighlevel.contact.create":
            self = .gohighlevelContactCreate(try GoHighLevelContactCreateToolProviderDetails(from: decoder))
        case "gohighlevel.contact.get":
            self = .gohighlevelContactGet(try GoHighLevelContactGetToolProviderDetails(from: decoder))
        case "google.calendar.event.create":
            self = .googleCalendarEventCreate(try GoogleCalendarCreateEventToolProviderDetails(from: decoder))
        case "google.sheets.row.append":
            self = .googleSheetsRowAppend(try GoogleSheetsRowAppendToolProviderDetails(from: decoder))
        case "make":
            self = .make(try MakeToolProviderDetails(from: decoder))
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
        case .function(let data):
            try container.encode("function", forKey: .type)
            try data.encode(to: encoder)
        case .ghl(let data):
            try container.encode("ghl", forKey: .type)
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
        case .googleCalendarEventCreate(let data):
            try container.encode("google.calendar.event.create", forKey: .type)
            try data.encode(to: encoder)
        case .googleSheetsRowAppend(let data):
            try container.encode("google.sheets.row.append", forKey: .type)
            try data.encode(to: encoder)
        case .make(let data):
            try container.encode("make", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}