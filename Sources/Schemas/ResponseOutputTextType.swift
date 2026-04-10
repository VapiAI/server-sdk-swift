import Foundation

/// The type of the output text
public enum ResponseOutputTextType: String, Codable, Hashable, CaseIterable, Sendable {
    case outputText = "output_text"
}