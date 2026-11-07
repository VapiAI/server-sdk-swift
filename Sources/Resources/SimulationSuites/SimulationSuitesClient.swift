import Foundation

public final class SimulationSuitesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns the simulation suites for the authenticated organization.
    ///
    /// - Parameter assistantId: Filter by any assigned assistant ID. Supplying both assistant and squad filters requires both to match.
    /// - Parameter squadId: Filter by any assigned squad ID. Supplying both assistant and squad filters requires both to match.
    /// - Parameter name: Search by simulation suite name
    /// - Parameter page: This is the page number to return. Defaults to 1.
    /// - Parameter sortOrder: This is the sort order for pagination. Defaults to 'DESC'.
    /// - Parameter sortBy: This is the column to sort by. Defaults to 'createdAt'.
    /// - Parameter limit: This is the maximum number of items to return. Defaults to 100.
    /// - Parameter createdAtGt: This will return items where the createdAt is greater than the specified value.
    /// - Parameter createdAtLt: This will return items where the createdAt is less than the specified value.
    /// - Parameter createdAtGe: This will return items where the createdAt is greater than or equal to the specified value.
    /// - Parameter createdAtLe: This will return items where the createdAt is less than or equal to the specified value.
    /// - Parameter updatedAtGt: This will return items where the updatedAt is greater than the specified value.
    /// - Parameter updatedAtLt: This will return items where the updatedAt is less than the specified value.
    /// - Parameter updatedAtGe: This will return items where the updatedAt is greater than or equal to the specified value.
    /// - Parameter updatedAtLe: This will return items where the updatedAt is less than or equal to the specified value.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func simulationSuiteControllerFindAll(assistantId: String? = nil, squadId: String? = nil, name: String? = nil, page: Double? = nil, sortOrder: SimulationSuiteControllerFindAllRequestSortOrder? = nil, sortBy: SimulationSuiteControllerFindAllRequestSortBy? = nil, limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> SimulationSuiteControllerFindAllResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/eval/simulation/suite",
            queryParams: [
                "assistantId": assistantId.map { .string($0) }, 
                "squadId": squadId.map { .string($0) }, 
                "name": name.map { .string($0) }, 
                "page": page.map { .double($0) }, 
                "sortOrder": sortOrder.map { .string($0.rawValue) }, 
                "sortBy": sortBy.map { .string($0.rawValue) }, 
                "limit": limit.map { .double($0) }, 
                "createdAtGt": createdAtGt.map { .date($0) }, 
                "createdAtLt": createdAtLt.map { .date($0) }, 
                "createdAtGe": createdAtGe.map { .date($0) }, 
                "createdAtLe": createdAtLe.map { .date($0) }, 
                "updatedAtGt": updatedAtGt.map { .date($0) }, 
                "updatedAtLt": updatedAtLt.map { .date($0) }, 
                "updatedAtGe": updatedAtGe.map { .date($0) }, 
                "updatedAtLe": updatedAtLe.map { .date($0) }
            ],
            requestOptions: requestOptions,
            responseType: SimulationSuiteControllerFindAllResponse.self
        )
    }

    /// Creates a simulation suite, a group of simulations that run together.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func simulationSuiteControllerCreate(request: Requests.CreateSimulationSuiteDto, requestOptions: RequestOptions? = nil) async throws -> SimulationSuite {
        return try await httpClient.performRequest(
            method: .post,
            path: "/eval/simulation/suite",
            body: request,
            requestOptions: requestOptions,
            responseType: SimulationSuite.self
        )
    }

    public func simulationSuiteControllerDuplicate(id: String, requestOptions: RequestOptions? = nil) async throws -> SimulationSuite {
        return try await httpClient.performRequest(
            method: .post,
            path: "/eval/simulation/suite/\(id)/duplicate",
            requestOptions: requestOptions,
            responseType: SimulationSuite.self
        )
    }

    /// Returns the specified simulation suite.
    ///
    /// - Parameter id: The unique identifier of the simulation suite.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func simulationSuiteControllerFindOne(id: String, requestOptions: RequestOptions? = nil) async throws -> SimulationSuite {
        return try await httpClient.performRequest(
            method: .get,
            path: "/eval/simulation/suite/\(id)",
            requestOptions: requestOptions,
            responseType: SimulationSuite.self
        )
    }

    /// Deletes the specified simulation suite.
    ///
    /// - Parameter id: The unique identifier of the simulation suite.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func simulationSuiteControllerRemove(id: String, requestOptions: RequestOptions? = nil) async throws -> SimulationSuite {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/eval/simulation/suite/\(id)",
            requestOptions: requestOptions,
            responseType: SimulationSuite.self
        )
    }

    /// Updates the specified simulation suite.
    ///
    /// - Parameter id: The unique identifier of the simulation suite.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func simulationSuiteControllerUpdate(id: String, request: Requests.UpdateSimulationSuiteDto, requestOptions: RequestOptions? = nil) async throws -> SimulationSuite {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/eval/simulation/suite/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: SimulationSuite.self
        )
    }

    /// Generate draft test requirements from an assistant's prompt, tools, and handoff configuration. The response includes numbered requirements describing expected behavior and open questions about behavior that needs clarification. Use this endpoint before generating a simulation suite.
    /// 
    /// Review the requirements and resolve any open questions. To revise a draft, send it as `previousDraft` together with natural-language `feedback` describing the changes or answers. Once the requirements are ready, pass them to `POST /eval/simulation/onboarding/suite`.
    /// 
    /// Requests can take up to 2 minutes. Each organization can draft requirements 60 times per UTC day, shared with the dashboard. A 429 `SIMULATION_ONBOARDING_QUOTA_EXCEEDED` response means the daily limit has been reached. Wait until the limit resets at 00:00 UTC before retrying.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func simulationOnboardingControllerRequirementsDraft(request: Requests.SimulationOnboardingRequirementsCreateDto, requestOptions: RequestOptions? = nil) async throws -> SimulationOnboardingRequirementsDraftDto {
        return try await httpClient.performRequest(
            method: .post,
            path: "/eval/simulation/onboarding/requirements",
            body: request,
            requestOptions: requestOptions,
            responseType: SimulationOnboardingRequirementsDraftDto.self
        )
    }

    /// Generate and save a simulation suite from reviewed test requirements, and assign it to an assistant. First draft requirements with `POST /eval/simulation/onboarding/requirements`. The response includes the saved suite, its simulations, and requirement coverage, including any gaps.
    /// 
    /// Requests can take up to 3 minutes. Set a client timeout of at least 200 seconds.
    /// 
    /// Use a unique `idempotencyKey` for each suite generation request. Retrying with the same key does not create a duplicate suite:
    /// - On a timeout or a 5xx (502, 504, 524), retry with the same key. You get the saved suite, a 409 while it is still generating, or a fresh generation if the first one never saved.
    /// - On a 409 `SIMULATION_ONBOARDING_GENERATION_IN_PROGRESS`, the first request is still generating. Wait `Retry-After` seconds (15) and retry with the same key.
    /// - On a 409 `SIMULATION_ONBOARDING_IDEMPOTENCY_KEY_REUSED`, the key was used for a different assistant or requirements. Send a new key.
    /// 
    /// Review the generated simulations and coverage gaps. Revise the suite with `PATCH /eval/simulation/onboarding/suite/{suiteId}`, then run it with `POST /eval/simulation/run`.
    /// 
    /// Each organization can generate 20 suites per UTC day, shared with the dashboard, and 2 at a time. A retry that returns a saved suite does not count toward these limits. On a 429 `SIMULATION_ONBOARDING_CONCURRENCY_LIMITED`, wait `Retry-After` seconds (30) before retrying. On a 429 `SIMULATION_ONBOARDING_QUOTA_EXCEEDED`, wait until the daily limit resets at 00:00 UTC before retrying.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func simulationOnboardingControllerSuiteCreate(request: Requests.SimulationOnboardingSuiteCreateDto, requestOptions: RequestOptions? = nil) async throws -> SimulationOnboardingSuiteViewDto {
        return try await httpClient.performRequest(
            method: .post,
            path: "/eval/simulation/onboarding/suite",
            body: request,
            requestOptions: requestOptions,
            responseType: SimulationOnboardingSuiteViewDto.self
        )
    }

    /// Revise a suite created by `POST /eval/simulation/onboarding/suite`. Remove simulations, rewrite scenarios using natural-language instructions, or set `retryFailed` to regenerate scenarios that failed or exceeded generation limits. The response includes the updated suite and requirement coverage.
    /// 
    /// Requests can take up to 2 minutes.
    /// 
    /// Send a new `patchKey` for each edit. Replaying an applied key changes nothing and returns the current suite, with `failedEditSimulationIds` listing the simulations that edit could not rewrite, so retry a timeout or a 5xx with the same key. A suite remembers its last 50 keys, so never reuse one.
    /// 
    /// Each organization can make 60 edits per UTC day, shared with the dashboard. Requests that only remove simulations and replays of applied edits do not count toward this limit. On a 429 `SIMULATION_ONBOARDING_QUOTA_EXCEEDED`, wait until the daily limit resets at 00:00 UTC before retrying.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func simulationOnboardingControllerSuiteUpdate(suiteId: String, request: Requests.SimulationOnboardingSuiteUpdateDto, requestOptions: RequestOptions? = nil) async throws -> SimulationOnboardingSuiteViewDto {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/eval/simulation/onboarding/suite/\(suiteId)",
            body: request,
            requestOptions: requestOptions,
            responseType: SimulationOnboardingSuiteViewDto.self
        )
    }
}