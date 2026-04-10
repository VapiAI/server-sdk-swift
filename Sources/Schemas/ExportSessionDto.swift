import Foundation

public struct ExportSessionDto: Codable, Hashable, Sendable {
    /// This is the unique identifier for the session to filter by.
    public let id: String?
    /// This is the name of the session to filter by.
    public let name: String?
    /// This is the ID of the assistant to filter sessions by.
    public let assistantId: String?
    /// Filter by multiple assistant IDs. Provide as comma-separated values.
    public let assistantIdAny: String?
    /// This is the ID of the squad to filter sessions by.
    public let squadId: String?
    /// This is the ID of the workflow to filter sessions by.
    public let workflowId: String?
    /// This is the customer information to filter by.
    public let customer: CreateCustomerDto?
    /// Filter by any of the specified customer phone numbers (comma-separated).
    public let customerNumberAny: String?
    /// Columns to include in the CSV export
    public let columns: ExportSessionDtoColumns?
    /// This is the email address to send the export to.
    /// Required if userId is not available in the request context.
    public let email: String?
    /// This is the format of the export.
    /// 
    /// @default csv
    public let format: ExportSessionDtoFormat?
    /// This will return sessions with the specified phoneNumberId.
    public let phoneNumberId: String?
    /// This will return sessions with any of the specified phoneNumberIds.
    public let phoneNumberIdAny: [String]?
    /// This is the page number to return. Defaults to 1.
    public let page: Double?
    /// This is the sort order for pagination. Defaults to 'DESC'.
    public let sortOrder: ExportSessionDtoSortOrder?
    /// This is the maximum number of items to return. Defaults to 100.
    public let limit: Double?
    /// This will return items where the createdAt is greater than the specified value.
    public let createdAtGt: Date?
    /// This will return items where the createdAt is less than the specified value.
    public let createdAtLt: Date?
    /// This will return items where the createdAt is greater than or equal to the specified value.
    public let createdAtGe: Date?
    /// This will return items where the createdAt is less than or equal to the specified value.
    public let createdAtLe: Date?
    /// This will return items where the updatedAt is greater than the specified value.
    public let updatedAtGt: Date?
    /// This will return items where the updatedAt is less than the specified value.
    public let updatedAtLt: Date?
    /// This will return items where the updatedAt is greater than or equal to the specified value.
    public let updatedAtGe: Date?
    /// This will return items where the updatedAt is less than or equal to the specified value.
    public let updatedAtLe: Date?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String? = nil,
        name: String? = nil,
        assistantId: String? = nil,
        assistantIdAny: String? = nil,
        squadId: String? = nil,
        workflowId: String? = nil,
        customer: CreateCustomerDto? = nil,
        customerNumberAny: String? = nil,
        columns: ExportSessionDtoColumns? = nil,
        email: String? = nil,
        format: ExportSessionDtoFormat? = nil,
        phoneNumberId: String? = nil,
        phoneNumberIdAny: [String]? = nil,
        page: Double? = nil,
        sortOrder: ExportSessionDtoSortOrder? = nil,
        limit: Double? = nil,
        createdAtGt: Date? = nil,
        createdAtLt: Date? = nil,
        createdAtGe: Date? = nil,
        createdAtLe: Date? = nil,
        updatedAtGt: Date? = nil,
        updatedAtLt: Date? = nil,
        updatedAtGe: Date? = nil,
        updatedAtLe: Date? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.name = name
        self.assistantId = assistantId
        self.assistantIdAny = assistantIdAny
        self.squadId = squadId
        self.workflowId = workflowId
        self.customer = customer
        self.customerNumberAny = customerNumberAny
        self.columns = columns
        self.email = email
        self.format = format
        self.phoneNumberId = phoneNumberId
        self.phoneNumberIdAny = phoneNumberIdAny
        self.page = page
        self.sortOrder = sortOrder
        self.limit = limit
        self.createdAtGt = createdAtGt
        self.createdAtLt = createdAtLt
        self.createdAtGe = createdAtGe
        self.createdAtLe = createdAtLe
        self.updatedAtGt = updatedAtGt
        self.updatedAtLt = updatedAtLt
        self.updatedAtGe = updatedAtGe
        self.updatedAtLe = updatedAtLe
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
        self.assistantIdAny = try container.decodeIfPresent(String.self, forKey: .assistantIdAny)
        self.squadId = try container.decodeIfPresent(String.self, forKey: .squadId)
        self.workflowId = try container.decodeIfPresent(String.self, forKey: .workflowId)
        self.customer = try container.decodeIfPresent(CreateCustomerDto.self, forKey: .customer)
        self.customerNumberAny = try container.decodeIfPresent(String.self, forKey: .customerNumberAny)
        self.columns = try container.decodeIfPresent(ExportSessionDtoColumns.self, forKey: .columns)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.format = try container.decodeIfPresent(ExportSessionDtoFormat.self, forKey: .format)
        self.phoneNumberId = try container.decodeIfPresent(String.self, forKey: .phoneNumberId)
        self.phoneNumberIdAny = try container.decodeIfPresent([String].self, forKey: .phoneNumberIdAny)
        self.page = try container.decodeIfPresent(Double.self, forKey: .page)
        self.sortOrder = try container.decodeIfPresent(ExportSessionDtoSortOrder.self, forKey: .sortOrder)
        self.limit = try container.decodeIfPresent(Double.self, forKey: .limit)
        self.createdAtGt = try container.decodeIfPresent(Date.self, forKey: .createdAtGt)
        self.createdAtLt = try container.decodeIfPresent(Date.self, forKey: .createdAtLt)
        self.createdAtGe = try container.decodeIfPresent(Date.self, forKey: .createdAtGe)
        self.createdAtLe = try container.decodeIfPresent(Date.self, forKey: .createdAtLe)
        self.updatedAtGt = try container.decodeIfPresent(Date.self, forKey: .updatedAtGt)
        self.updatedAtLt = try container.decodeIfPresent(Date.self, forKey: .updatedAtLt)
        self.updatedAtGe = try container.decodeIfPresent(Date.self, forKey: .updatedAtGe)
        self.updatedAtLe = try container.decodeIfPresent(Date.self, forKey: .updatedAtLe)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
        try container.encodeIfPresent(self.assistantIdAny, forKey: .assistantIdAny)
        try container.encodeIfPresent(self.squadId, forKey: .squadId)
        try container.encodeIfPresent(self.workflowId, forKey: .workflowId)
        try container.encodeIfPresent(self.customer, forKey: .customer)
        try container.encodeIfPresent(self.customerNumberAny, forKey: .customerNumberAny)
        try container.encodeIfPresent(self.columns, forKey: .columns)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.format, forKey: .format)
        try container.encodeIfPresent(self.phoneNumberId, forKey: .phoneNumberId)
        try container.encodeIfPresent(self.phoneNumberIdAny, forKey: .phoneNumberIdAny)
        try container.encodeIfPresent(self.page, forKey: .page)
        try container.encodeIfPresent(self.sortOrder, forKey: .sortOrder)
        try container.encodeIfPresent(self.limit, forKey: .limit)
        try container.encodeIfPresent(self.createdAtGt, forKey: .createdAtGt)
        try container.encodeIfPresent(self.createdAtLt, forKey: .createdAtLt)
        try container.encodeIfPresent(self.createdAtGe, forKey: .createdAtGe)
        try container.encodeIfPresent(self.createdAtLe, forKey: .createdAtLe)
        try container.encodeIfPresent(self.updatedAtGt, forKey: .updatedAtGt)
        try container.encodeIfPresent(self.updatedAtLt, forKey: .updatedAtLt)
        try container.encodeIfPresent(self.updatedAtGe, forKey: .updatedAtGe)
        try container.encodeIfPresent(self.updatedAtLe, forKey: .updatedAtLe)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case assistantId
        case assistantIdAny
        case squadId
        case workflowId
        case customer
        case customerNumberAny
        case columns
        case email
        case format
        case phoneNumberId
        case phoneNumberIdAny
        case page
        case sortOrder
        case limit
        case createdAtGt
        case createdAtLt
        case createdAtGe
        case createdAtLe
        case updatedAtGt
        case updatedAtLt
        case updatedAtGe
        case updatedAtLe
    }
}