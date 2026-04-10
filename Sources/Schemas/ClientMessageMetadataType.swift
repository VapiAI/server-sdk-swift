import Foundation

/// This is the type of the message. "metadata" is sent to forward metadata to the client.
public enum ClientMessageMetadataType: String, Codable, Hashable, CaseIterable, Sendable {
    case metadata
}