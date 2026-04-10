import Foundation

public enum CreateEvalDtoMessagesItem: Codable, Hashable, Sendable {
    case chatEvalAssistantMessageEvaluation(ChatEvalAssistantMessageEvaluation)
    case chatEvalAssistantMessageMock(ChatEvalAssistantMessageMock)
    case chatEvalSystemMessageMock(ChatEvalSystemMessageMock)
    case chatEvalToolResponseMessageEvaluation(ChatEvalToolResponseMessageEvaluation)
    case chatEvalToolResponseMessageMock(ChatEvalToolResponseMessageMock)
    case chatEvalUserMessageMock(ChatEvalUserMessageMock)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(ChatEvalAssistantMessageEvaluation.self) {
            self = .chatEvalAssistantMessageEvaluation(value)
        } else if let value = try? container.decode(ChatEvalAssistantMessageMock.self) {
            self = .chatEvalAssistantMessageMock(value)
        } else if let value = try? container.decode(ChatEvalSystemMessageMock.self) {
            self = .chatEvalSystemMessageMock(value)
        } else if let value = try? container.decode(ChatEvalToolResponseMessageEvaluation.self) {
            self = .chatEvalToolResponseMessageEvaluation(value)
        } else if let value = try? container.decode(ChatEvalToolResponseMessageMock.self) {
            self = .chatEvalToolResponseMessageMock(value)
        } else if let value = try? container.decode(ChatEvalUserMessageMock.self) {
            self = .chatEvalUserMessageMock(value)
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
        case .chatEvalAssistantMessageEvaluation(let value):
            try container.encode(value)
        case .chatEvalAssistantMessageMock(let value):
            try container.encode(value)
        case .chatEvalSystemMessageMock(let value):
            try container.encode(value)
        case .chatEvalToolResponseMessageEvaluation(let value):
            try container.encode(value)
        case .chatEvalToolResponseMessageMock(let value):
            try container.encode(value)
        case .chatEvalUserMessageMock(let value):
            try container.encode(value)
        }
    }
}