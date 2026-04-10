import Foundation

/// This is the type of the message. "call.endpointing.request" is sent when using `assistant.startSpeakingPlan.smartEndpointingPlan={ "provider": "custom-endpointing-model" }`.
/// 
/// Here is what the request will look like:
/// 
/// POST https://{assistant.startSpeakingPlan.smartEndpointingPlan.server.url}
/// Content-Type: application/json
/// 
/// {
///   "message": {
///     "type": "call.endpointing.request",
///     "messages": [
///       {
///         "role": "user",
///         "message": "Hello, how are you?",
///         "time": 1234567890,
///         "secondsFromStart": 0
///       }
///     ],
///     ...other metadata about the call...
///   }
/// }
/// 
/// The expected response:
/// {
///   "timeoutSeconds": 0.5
/// }
public enum ServerMessageCallEndpointingRequestType: String, Codable, Hashable, CaseIterable, Sendable {
    case callEndpointingRequest = "call.endpointing.request"
}