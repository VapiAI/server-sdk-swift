import Foundation

/// This is the type of the regex option. Options are:
/// - `ignore-case`: Ignores the case of the text being matched. Add
/// - `whole-word`: Matches whole words only.
/// - `multi-line`: Matches across multiple lines.
public enum RegexOptionType: String, Codable, Hashable, CaseIterable, Sendable {
    case ignoreCase = "ignore-case"
    case wholeWord = "whole-word"
    case multiLine = "multi-line"
}