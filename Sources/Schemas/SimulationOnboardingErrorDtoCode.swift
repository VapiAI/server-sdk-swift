import Foundation

/// Which refusal this is. Retry `SIMULATION_ONBOARDING_GENERATION_IN_PROGRESS` with the same key and `SIMULATION_ONBOARDING_CONCURRENCY_LIMITED` or `SIMULATION_ONBOARDING_QUOTA_UNAVAILABLE` after `retryAfterSeconds`, send a new key for `SIMULATION_ONBOARDING_IDEMPOTENCY_KEY_REUSED`, and stop for `SIMULATION_ONBOARDING_QUOTA_EXCEEDED`.
public enum SimulationOnboardingErrorDtoCode: String, Codable, Hashable, CaseIterable, Sendable {
    case simulationOnboardingGenerationInProgress = "SIMULATION_ONBOARDING_GENERATION_IN_PROGRESS"
    case simulationOnboardingIdempotencyKeyReused = "SIMULATION_ONBOARDING_IDEMPOTENCY_KEY_REUSED"
    case simulationOnboardingConcurrencyLimited = "SIMULATION_ONBOARDING_CONCURRENCY_LIMITED"
    case simulationOnboardingQuotaExceeded = "SIMULATION_ONBOARDING_QUOTA_EXCEEDED"
    case simulationOnboardingQuotaUnavailable = "SIMULATION_ONBOARDING_QUOTA_UNAVAILABLE"
}