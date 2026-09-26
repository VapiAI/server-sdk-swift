import Foundation

/// Commentary is spoken in the model's own words; thinking is silent context;
/// instructions steer the speaker, including requests to try saying something.
/// Acceptance does not guarantee exact wording or speech completion.
public enum ClientInboundMessageAppendContextKind: String, Codable, Hashable, CaseIterable, Sendable {
    case commentary
    case thinking
    case instructions
}