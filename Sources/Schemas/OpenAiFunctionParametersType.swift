import Foundation

/// This must be set to 'object'. It instructs the model to return a JSON object containing the function call properties.
public enum OpenAiFunctionParametersType: String, Codable, Hashable, CaseIterable, Sendable {
    case object
}