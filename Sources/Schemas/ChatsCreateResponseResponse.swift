import Foundation

public enum ChatsCreateResponseResponse: Codable, Hashable, Sendable {
    case responseObject(ResponseObject)
    case responseTextDeltaEvent(ResponseTextDeltaEvent)
    case responseTextDoneEvent(ResponseTextDoneEvent)
    case responseCompletedEvent(ResponseCompletedEvent)
    case responseErrorEvent(ResponseErrorEvent)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(ResponseObject.self) {
            self = .responseObject(value)
        } else if let value = try? container.decode(ResponseTextDeltaEvent.self) {
            self = .responseTextDeltaEvent(value)
        } else if let value = try? container.decode(ResponseTextDoneEvent.self) {
            self = .responseTextDoneEvent(value)
        } else if let value = try? container.decode(ResponseCompletedEvent.self) {
            self = .responseCompletedEvent(value)
        } else if let value = try? container.decode(ResponseErrorEvent.self) {
            self = .responseErrorEvent(value)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Unexpected value."
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.singleValueContainer()
        switch self {
        case .responseObject(let value):
            try container.encode(value)
        case .responseTextDeltaEvent(let value):
            try container.encode(value)
        case .responseTextDoneEvent(let value):
            try container.encode(value)
        case .responseCompletedEvent(let value):
            try container.encode(value)
        case .responseErrorEvent(let value):
            try container.encode(value)
        }
    }
}