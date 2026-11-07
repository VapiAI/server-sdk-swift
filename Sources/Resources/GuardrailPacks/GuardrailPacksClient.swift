import Foundation

public final class GuardrailPacksClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func guardrailPacksControllerList(limit: Double? = nil, search: String? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> [GuardrailPack] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/guardrail/packs",
            queryParams: [
                "limit": limit.map { .double($0) }, 
                "search": search.map { .string($0) }, 
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
            responseType: [GuardrailPack].self
        )
    }

    public func guardrailPacksControllerPaginated(limit: Double? = nil, search: String? = nil, sortBy: GuardrailPacksControllerPaginatedRequestSortBy? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, page: Double? = nil, sortOrder: GuardrailPacksControllerPaginatedRequestSortOrder? = nil, requestOptions: RequestOptions? = nil) async throws -> GuardrailPacksPage {
        return try await httpClient.performRequest(
            method: .get,
            path: "/guardrail/packs/paginated",
            queryParams: [
                "limit": limit.map { .double($0) }, 
                "search": search.map { .string($0) }, 
                "sortBy": sortBy.map { .string($0.rawValue) }, 
                "createdAtGt": createdAtGt.map { .date($0) }, 
                "createdAtLt": createdAtLt.map { .date($0) }, 
                "createdAtGe": createdAtGe.map { .date($0) }, 
                "createdAtLe": createdAtLe.map { .date($0) }, 
                "updatedAtGt": updatedAtGt.map { .date($0) }, 
                "updatedAtLt": updatedAtLt.map { .date($0) }, 
                "updatedAtGe": updatedAtGe.map { .date($0) }, 
                "updatedAtLe": updatedAtLe.map { .date($0) }, 
                "page": page.map { .double($0) }, 
                "sortOrder": sortOrder.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: GuardrailPacksPage.self
        )
    }

    public func guardrailPacksControllerFind(id: String, requestOptions: RequestOptions? = nil) async throws -> GuardrailPack {
        return try await httpClient.performRequest(
            method: .get,
            path: "/guardrail/packs/\(id)",
            requestOptions: requestOptions,
            responseType: GuardrailPack.self
        )
    }
}