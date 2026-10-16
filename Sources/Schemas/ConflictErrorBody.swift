import Foundation

public enum ConflictErrorBody: Codable, Hashable, Sendable {
    case toolPinned(ToolPinnedConflictResponseDto)
    case toolWriteConflict(ToolWriteConflictResponseDto)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .error)
        switch discriminant {
        case "tool_pinned":
            self = .toolPinned(try ToolPinnedConflictResponseDto(from: decoder))
        case "tool_write_conflict":
            self = .toolWriteConflict(try ToolWriteConflictResponseDto(from: decoder))
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
        case .toolPinned(let data):
            try container.encode("tool_pinned", forKey: .error)
            try data.encode(to: encoder)
        case .toolWriteConflict(let data):
            try container.encode("tool_write_conflict", forKey: .error)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case error
    }
}