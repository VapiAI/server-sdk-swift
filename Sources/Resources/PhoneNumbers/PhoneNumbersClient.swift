import Foundation

public final class PhoneNumbersClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func list(limit: Nullable<Double>? = nil, createdAtGt: Nullable<Date>? = nil, createdAtLt: Nullable<Date>? = nil, createdAtGe: Nullable<Date>? = nil, createdAtLe: Nullable<Date>? = nil, updatedAtGt: Nullable<Date>? = nil, updatedAtLt: Nullable<Date>? = nil, updatedAtGe: Nullable<Date>? = nil, updatedAtLe: Nullable<Date>? = nil, requestOptions: RequestOptions? = nil) async throws -> [PhoneNumbersListResponseItem] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/phone-number",
            queryParams: [
                "limit": limit?.wrappedValue.map { .double($0) }, 
                "createdAtGt": createdAtGt?.wrappedValue.map { .date($0) }, 
                "createdAtLt": createdAtLt?.wrappedValue.map { .date($0) }, 
                "createdAtGe": createdAtGe?.wrappedValue.map { .date($0) }, 
                "createdAtLe": createdAtLe?.wrappedValue.map { .date($0) }, 
                "updatedAtGt": updatedAtGt?.wrappedValue.map { .date($0) }, 
                "updatedAtLt": updatedAtLt?.wrappedValue.map { .date($0) }, 
                "updatedAtGe": updatedAtGe?.wrappedValue.map { .date($0) }, 
                "updatedAtLe": updatedAtLe?.wrappedValue.map { .date($0) }
            ],
            requestOptions: requestOptions,
            responseType: [PhoneNumbersListResponseItem].self
        )
    }

    public func create(request: PhoneNumbersCreateRequest, requestOptions: RequestOptions? = nil) async throws -> PhoneNumbersCreateResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/phone-number",
            body: request,
            requestOptions: requestOptions,
            responseType: PhoneNumbersCreateResponse.self
        )
    }

    public func phoneNumberControllerFindAllPaginated(search: Nullable<String>? = nil, page: Nullable<Double>? = nil, sortOrder: Nullable<PhoneNumberControllerFindAllPaginatedRequestSortOrder>? = nil, limit: Nullable<Double>? = nil, createdAtGt: Nullable<Date>? = nil, createdAtLt: Nullable<Date>? = nil, createdAtGe: Nullable<Date>? = nil, createdAtLe: Nullable<Date>? = nil, updatedAtGt: Nullable<Date>? = nil, updatedAtLt: Nullable<Date>? = nil, updatedAtGe: Nullable<Date>? = nil, updatedAtLe: Nullable<Date>? = nil, requestOptions: RequestOptions? = nil) async throws -> PhoneNumberPaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v2/phone-number",
            queryParams: [
                "search": search?.wrappedValue.map { .string($0) }, 
                "page": page?.wrappedValue.map { .double($0) }, 
                "sortOrder": sortOrder?.wrappedValue.map { .string($0.rawValue) }, 
                "limit": limit?.wrappedValue.map { .double($0) }, 
                "createdAtGt": createdAtGt?.wrappedValue.map { .date($0) }, 
                "createdAtLt": createdAtLt?.wrappedValue.map { .date($0) }, 
                "createdAtGe": createdAtGe?.wrappedValue.map { .date($0) }, 
                "createdAtLe": createdAtLe?.wrappedValue.map { .date($0) }, 
                "updatedAtGt": updatedAtGt?.wrappedValue.map { .date($0) }, 
                "updatedAtLt": updatedAtLt?.wrappedValue.map { .date($0) }, 
                "updatedAtGe": updatedAtGe?.wrappedValue.map { .date($0) }, 
                "updatedAtLe": updatedAtLe?.wrappedValue.map { .date($0) }
            ],
            requestOptions: requestOptions,
            responseType: PhoneNumberPaginatedResponse.self
        )
    }

    public func get(id: String, requestOptions: RequestOptions? = nil) async throws -> PhoneNumbersGetResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/phone-number/\(id)",
            requestOptions: requestOptions,
            responseType: PhoneNumbersGetResponse.self
        )
    }

    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> PhoneNumbersDeleteResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/phone-number/\(id)",
            requestOptions: requestOptions,
            responseType: PhoneNumbersDeleteResponse.self
        )
    }

    public func update(id: String, request: PhoneNumbersUpdateRequest, requestOptions: RequestOptions? = nil) async throws -> PhoneNumbersUpdateResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/phone-number/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: PhoneNumbersUpdateResponse.self
        )
    }
}