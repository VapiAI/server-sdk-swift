import Foundation

public enum CreateResponseChatsResponse: Codable, Hashable, Sendable {
    case responseCompletedEvent(ResponseCompletedEvent)
    case responseErrorEvent(ResponseErrorEvent)
    case responseObject(ResponseObject)
    case responseTextDeltaEvent(ResponseTextDeltaEvent)
    case responseTextDoneEvent(ResponseTextDoneEvent)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(ResponseCompletedEvent.self) {
            self = .responseCompletedEvent(value)
        } else if let value = try? container.decode(ResponseErrorEvent.self) {
            self = .responseErrorEvent(value)
        } else if let value = try? container.decode(ResponseObject.self) {
            self = .responseObject(value)
        } else if let value = try? container.decode(ResponseTextDeltaEvent.self) {
            self = .responseTextDeltaEvent(value)
        } else if let value = try? container.decode(ResponseTextDoneEvent.self) {
            self = .responseTextDoneEvent(value)
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
        case .responseCompletedEvent(let value):
            try container.encode(value)
        case .responseErrorEvent(let value):
            try container.encode(value)
        case .responseObject(let value):
            try container.encode(value)
        case .responseTextDeltaEvent(let value):
            try container.encode(value)
        case .responseTextDoneEvent(let value):
            try container.encode(value)
        }
    }
}