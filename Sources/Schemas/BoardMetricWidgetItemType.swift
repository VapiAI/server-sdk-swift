import Foundation

public enum BoardMetricWidgetItemType: String, Codable, Hashable, CaseIterable, Sendable {
    case failedCallsList = "failed_calls_list"
    case concurrencyChart = "concurrency_chart"
    case averageCostBreakdownChart = "average_cost_breakdown_chart"
}