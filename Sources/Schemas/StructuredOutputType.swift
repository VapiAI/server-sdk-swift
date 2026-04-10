import Foundation

/// This is the type of structured output.
/// 
/// - 'ai': Uses an LLM to extract structured data from the conversation (default).
/// - 'regex': Uses a regex pattern to extract data from the transcript without an LLM.
public enum StructuredOutputType: String, Codable, Hashable, CaseIterable, Sendable {
    case ai
    case regex
}