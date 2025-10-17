import Foundation

/// This is the provider for the smart endpointing plan.
public enum VapiSmartEndpointingPlanProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case vapi
    case livekit
    case customEndpointingModel = "custom-endpointing-model"
}