import Foundation

public struct TranscriptEvaluationResult: Codable, Hashable, Sendable {
    /// This is the word error rate: (substitutions + deletions + insertions)
    /// divided by the answer key's word count. Null when the answer key has no
    /// words.
    public let wer: Nullable<Double>
    /// This is the number of answer-key words transcribed correctly.
    public let hits: Double
    /// This is the number of answer-key words transcribed as a different word.
    public let substitutions: Double
    /// This is the number of answer-key words missing from the transcript.
    public let deletions: Double
    /// This is the number of transcript words with no answer-key word.
    public let insertions: Double
    /// This is the number of words in the normalized answer key.
    public let referenceWordCount: Double
    /// This is the number of words in the normalized transcript.
    public let hypothesisWordCount: Double
    /// This is each key value's verdict, in answer-key order.
    public let keyValues: [TranscriptKeyValueResult]
    /// This is each of the scenario's metric evaluations, in the scenario's order.
    public let evaluations: [TranscriptMetricEvaluationResult]
    /// This is false when a required evaluation failed or a required key value
    /// did not come through exactly.
    public let passed: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        wer: Nullable<Double>,
        hits: Double,
        substitutions: Double,
        deletions: Double,
        insertions: Double,
        referenceWordCount: Double,
        hypothesisWordCount: Double,
        keyValues: [TranscriptKeyValueResult],
        evaluations: [TranscriptMetricEvaluationResult],
        passed: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.wer = wer
        self.hits = hits
        self.substitutions = substitutions
        self.deletions = deletions
        self.insertions = insertions
        self.referenceWordCount = referenceWordCount
        self.hypothesisWordCount = hypothesisWordCount
        self.keyValues = keyValues
        self.evaluations = evaluations
        self.passed = passed
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.wer = try container.decode(Nullable<Double>.self, forKey: .wer)
        self.hits = try container.decode(Double.self, forKey: .hits)
        self.substitutions = try container.decode(Double.self, forKey: .substitutions)
        self.deletions = try container.decode(Double.self, forKey: .deletions)
        self.insertions = try container.decode(Double.self, forKey: .insertions)
        self.referenceWordCount = try container.decode(Double.self, forKey: .referenceWordCount)
        self.hypothesisWordCount = try container.decode(Double.self, forKey: .hypothesisWordCount)
        self.keyValues = try container.decode([TranscriptKeyValueResult].self, forKey: .keyValues)
        self.evaluations = try container.decode([TranscriptMetricEvaluationResult].self, forKey: .evaluations)
        self.passed = try container.decode(Bool.self, forKey: .passed)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.wer, forKey: .wer)
        try container.encode(self.hits, forKey: .hits)
        try container.encode(self.substitutions, forKey: .substitutions)
        try container.encode(self.deletions, forKey: .deletions)
        try container.encode(self.insertions, forKey: .insertions)
        try container.encode(self.referenceWordCount, forKey: .referenceWordCount)
        try container.encode(self.hypothesisWordCount, forKey: .hypothesisWordCount)
        try container.encode(self.keyValues, forKey: .keyValues)
        try container.encode(self.evaluations, forKey: .evaluations)
        try container.encode(self.passed, forKey: .passed)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case wer
        case hits
        case substitutions
        case deletions
        case insertions
        case referenceWordCount
        case hypothesisWordCount
        case keyValues
        case evaluations
        case passed
    }
}