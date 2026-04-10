import Foundation

public enum UpdatePhoneNumbersRequestBody: Codable, Hashable, Sendable {
    case byoPhoneNumber(UpdateByoPhoneNumberDto)
    case telnyx(UpdateTelnyxPhoneNumberDto)
    case twilio(UpdateTwilioPhoneNumberDto)
    case vapi(UpdateVapiPhoneNumberDto)
    case vonage(UpdateVonagePhoneNumberDto)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .provider)
        switch discriminant {
        case "byo-phone-number":
            self = .byoPhoneNumber(try UpdateByoPhoneNumberDto(from: decoder))
        case "telnyx":
            self = .telnyx(try UpdateTelnyxPhoneNumberDto(from: decoder))
        case "twilio":
            self = .twilio(try UpdateTwilioPhoneNumberDto(from: decoder))
        case "vapi":
            self = .vapi(try UpdateVapiPhoneNumberDto(from: decoder))
        case "vonage":
            self = .vonage(try UpdateVonagePhoneNumberDto(from: decoder))
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
        case .byoPhoneNumber(let data):
            try container.encode("byo-phone-number", forKey: .provider)
            try data.encode(to: encoder)
        case .telnyx(let data):
            try container.encode("telnyx", forKey: .provider)
            try data.encode(to: encoder)
        case .twilio(let data):
            try container.encode("twilio", forKey: .provider)
            try data.encode(to: encoder)
        case .vapi(let data):
            try container.encode("vapi", forKey: .provider)
            try data.encode(to: encoder)
        case .vonage(let data):
            try container.encode("vonage", forKey: .provider)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
    }
}