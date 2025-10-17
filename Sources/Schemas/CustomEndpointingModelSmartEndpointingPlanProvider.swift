import Foundation

/// This is the provider for the smart endpointing plan. Use `custom-endpointing-model` for custom endpointing providers that are not natively supported.
public enum CustomEndpointingModelSmartEndpointingPlanProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case vapi
    case livekit
    case customEndpointingModel = "custom-endpointing-model"
}