import Foundation

public enum SquadMemberDtoAssistantDestinationsItem: Codable, Hashable, Sendable {
    case transferDestinationAssistant(TransferDestinationAssistant)
    case handoffDestinationAssistant(HandoffDestinationAssistant)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(TransferDestinationAssistant.self) {
            self = .transferDestinationAssistant(value)
        } else if let value = try? container.decode(HandoffDestinationAssistant.self) {
            self = .handoffDestinationAssistant(value)
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
        case .transferDestinationAssistant(let value):
            try container.encode(value)
        case .handoffDestinationAssistant(let value):
            try container.encode(value)
        }
    }
}