import Foundation

/// This is the type of the message. "transfer-destination-request" is sent when the model is requesting transfer but destination is unknown.
public enum ServerMessageTransferDestinationRequestType: String, Codable, Hashable, CaseIterable, Sendable {
    case transferDestinationRequest = "transfer-destination-request"
}