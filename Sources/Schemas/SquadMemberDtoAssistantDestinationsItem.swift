import Foundation

public indirect enum SquadMemberDtoAssistantDestinationsItem: Codable, Hashable, Sendable {
    case handoffDestinationAssistant(HandoffDestinationAssistant)
    case transferDestinationAssistant(TransferDestinationAssistant)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(HandoffDestinationAssistant.self) {
            self = .handoffDestinationAssistant(value)
        } else if let value = try? container.decode(TransferDestinationAssistant.self) {
            self = .transferDestinationAssistant(value)
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
        case .handoffDestinationAssistant(let value):
            try container.encode(value)
        case .transferDestinationAssistant(let value):
            try container.encode(value)
        }
    }
}