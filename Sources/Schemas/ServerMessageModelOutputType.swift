import Foundation

/// This is the type of the message. "model-output" is sent as the model outputs tokens.
public enum ServerMessageModelOutputType: String, Codable, Hashable, CaseIterable, Sendable {
    case modelOutput = "model-output"
}