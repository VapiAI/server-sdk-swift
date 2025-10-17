import Foundation

public struct Workflow: Codable, Hashable, Sendable {
    public let nodes: [WorkflowNodesItem]
    /// This is the model for the workflow.
    /// 
    /// This can be overridden at node level using `nodes[n].model`.
    public let model: WorkflowModel?
    /// This is the transcriber for the workflow.
    /// 
    /// This can be overridden at node level using `nodes[n].transcriber`.
    public let transcriber: WorkflowTranscriber?
    /// This is the voice for the workflow.
    /// 
    /// This can be overridden at node level using `nodes[n].voice`.
    public let voice: WorkflowVoice?
    /// This is the plan for observability of workflow's calls.
    /// 
    /// Currently, only Langfuse is supported.
    public let observabilityPlan: LangfuseObservabilityPlan?
    /// This is the background sound in the call. Default for phone calls is 'office' and default for web calls is 'off'.
    /// You can also provide a custom sound by providing a URL to an audio file.
    public let backgroundSound: WorkflowBackgroundSound?
    /// This is a set of actions that will be performed on certain events.
    public let hooks: [WorkflowHooksItem]?
    /// These are dynamic credentials that will be used for the workflow calls. By default, all the credentials are available for use in the call but you can supplement an additional credentials using this. Dynamic credentials override existing credentials.
    public let credentials: [WorkflowCredentialsItem]?
    /// This is the voicemail detection plan for the workflow.
    public let voicemailDetection: WorkflowVoicemailDetection?
    /// This is the maximum duration of the call in seconds.
    /// 
    /// After this duration, the call will automatically end.
    /// 
    /// Default is 1800 (30 minutes), max is 43200 (12 hours), and min is 10 seconds.
    public let maxDurationSeconds: Double?
    public let id: String
    public let orgId: String
    public let createdAt: Date
    public let updatedAt: Date
    public let name: String
    public let edges: [Edge]
    public let globalPrompt: String?
    /// This is where Vapi will send webhooks. You can find all webhooks available along with their shape in ServerMessage schema.
    /// 
    /// The order of precedence is:
    /// 
    /// 1. tool.server
    /// 2. workflow.server / assistant.server
    /// 3. phoneNumber.server
    /// 4. org.server
    public let server: Server?
    /// This is the compliance plan for the workflow. It allows you to configure HIPAA and other compliance settings.
    public let compliancePlan: CompliancePlan?
    /// This is the plan for analysis of workflow's calls. Stored in `call.analysis`.
    public let analysisPlan: AnalysisPlan?
    /// This is the plan for artifacts generated during workflow's calls. Stored in `call.artifact`.
    public let artifactPlan: ArtifactPlan?
    /// This is the plan for when the workflow nodes should start talking.
    /// 
    /// You should configure this if you're running into these issues:
    /// - The assistant is too slow to start talking after the customer is done speaking.
    /// - The assistant is too fast to start talking after the customer is done speaking.
    /// - The assistant is so fast that it's actually interrupting the customer.
    public let startSpeakingPlan: StartSpeakingPlan?
    /// This is the plan for when workflow nodes should stop talking on customer interruption.
    /// 
    /// You should configure this if you're running into these issues:
    /// - The assistant is too slow to recognize customer's interruption.
    /// - The assistant is too fast to recognize customer's interruption.
    /// - The assistant is getting interrupted by phrases that are just acknowledgments.
    /// - The assistant is getting interrupted by background noises.
    /// - The assistant is not properly stopping -- it starts talking right after getting interrupted.
    public let stopSpeakingPlan: StopSpeakingPlan?
    /// This is the plan for real-time monitoring of the workflow's calls.
    /// 
    /// Usage:
    /// - To enable live listening of the workflow's calls, set `monitorPlan.listenEnabled` to `true`.
    /// - To enable live control of the workflow's calls, set `monitorPlan.controlEnabled` to `true`.
    public let monitorPlan: MonitorPlan?
    /// This enables filtering of noise and background speech while the user is talking.
    /// 
    /// Features:
    /// - Smart denoising using Krisp
    /// - Fourier denoising
    /// 
    /// Both can be used together. Order of precedence:
    /// - Smart denoising
    /// - Fourier denoising
    public let backgroundSpeechDenoisingPlan: BackgroundSpeechDenoisingPlan?
    /// These are the credentials that will be used for the workflow calls. By default, all the credentials are available for use in the call but you can provide a subset using this.
    public let credentialIds: [String]?
    /// This is the plan for keypad input handling during workflow calls.
    public let keypadInputPlan: KeypadInputPlan?
    /// This is the message that the assistant will say if the call is forwarded to voicemail.
    /// 
    /// If unspecified, it will hang up.
    public let voicemailMessage: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        nodes: [WorkflowNodesItem],
        model: WorkflowModel? = nil,
        transcriber: WorkflowTranscriber? = nil,
        voice: WorkflowVoice? = nil,
        observabilityPlan: LangfuseObservabilityPlan? = nil,
        backgroundSound: WorkflowBackgroundSound? = nil,
        hooks: [WorkflowHooksItem]? = nil,
        credentials: [WorkflowCredentialsItem]? = nil,
        voicemailDetection: WorkflowVoicemailDetection? = nil,
        maxDurationSeconds: Double? = nil,
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        name: String,
        edges: [Edge],
        globalPrompt: String? = nil,
        server: Server? = nil,
        compliancePlan: CompliancePlan? = nil,
        analysisPlan: AnalysisPlan? = nil,
        artifactPlan: ArtifactPlan? = nil,
        startSpeakingPlan: StartSpeakingPlan? = nil,
        stopSpeakingPlan: StopSpeakingPlan? = nil,
        monitorPlan: MonitorPlan? = nil,
        backgroundSpeechDenoisingPlan: BackgroundSpeechDenoisingPlan? = nil,
        credentialIds: [String]? = nil,
        keypadInputPlan: KeypadInputPlan? = nil,
        voicemailMessage: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.nodes = nodes
        self.model = model
        self.transcriber = transcriber
        self.voice = voice
        self.observabilityPlan = observabilityPlan
        self.backgroundSound = backgroundSound
        self.hooks = hooks
        self.credentials = credentials
        self.voicemailDetection = voicemailDetection
        self.maxDurationSeconds = maxDurationSeconds
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.edges = edges
        self.globalPrompt = globalPrompt
        self.server = server
        self.compliancePlan = compliancePlan
        self.analysisPlan = analysisPlan
        self.artifactPlan = artifactPlan
        self.startSpeakingPlan = startSpeakingPlan
        self.stopSpeakingPlan = stopSpeakingPlan
        self.monitorPlan = monitorPlan
        self.backgroundSpeechDenoisingPlan = backgroundSpeechDenoisingPlan
        self.credentialIds = credentialIds
        self.keypadInputPlan = keypadInputPlan
        self.voicemailMessage = voicemailMessage
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.nodes = try container.decode([WorkflowNodesItem].self, forKey: .nodes)
        self.model = try container.decodeIfPresent(WorkflowModel.self, forKey: .model)
        self.transcriber = try container.decodeIfPresent(WorkflowTranscriber.self, forKey: .transcriber)
        self.voice = try container.decodeIfPresent(WorkflowVoice.self, forKey: .voice)
        self.observabilityPlan = try container.decodeIfPresent(LangfuseObservabilityPlan.self, forKey: .observabilityPlan)
        self.backgroundSound = try container.decodeIfPresent(WorkflowBackgroundSound.self, forKey: .backgroundSound)
        self.hooks = try container.decodeIfPresent([WorkflowHooksItem].self, forKey: .hooks)
        self.credentials = try container.decodeIfPresent([WorkflowCredentialsItem].self, forKey: .credentials)
        self.voicemailDetection = try container.decodeIfPresent(WorkflowVoicemailDetection.self, forKey: .voicemailDetection)
        self.maxDurationSeconds = try container.decodeIfPresent(Double.self, forKey: .maxDurationSeconds)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.name = try container.decode(String.self, forKey: .name)
        self.edges = try container.decode([Edge].self, forKey: .edges)
        self.globalPrompt = try container.decodeIfPresent(String.self, forKey: .globalPrompt)
        self.server = try container.decodeIfPresent(Server.self, forKey: .server)
        self.compliancePlan = try container.decodeIfPresent(CompliancePlan.self, forKey: .compliancePlan)
        self.analysisPlan = try container.decodeIfPresent(AnalysisPlan.self, forKey: .analysisPlan)
        self.artifactPlan = try container.decodeIfPresent(ArtifactPlan.self, forKey: .artifactPlan)
        self.startSpeakingPlan = try container.decodeIfPresent(StartSpeakingPlan.self, forKey: .startSpeakingPlan)
        self.stopSpeakingPlan = try container.decodeIfPresent(StopSpeakingPlan.self, forKey: .stopSpeakingPlan)
        self.monitorPlan = try container.decodeIfPresent(MonitorPlan.self, forKey: .monitorPlan)
        self.backgroundSpeechDenoisingPlan = try container.decodeIfPresent(BackgroundSpeechDenoisingPlan.self, forKey: .backgroundSpeechDenoisingPlan)
        self.credentialIds = try container.decodeIfPresent([String].self, forKey: .credentialIds)
        self.keypadInputPlan = try container.decodeIfPresent(KeypadInputPlan.self, forKey: .keypadInputPlan)
        self.voicemailMessage = try container.decodeIfPresent(String.self, forKey: .voicemailMessage)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.nodes, forKey: .nodes)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encodeIfPresent(self.transcriber, forKey: .transcriber)
        try container.encodeIfPresent(self.voice, forKey: .voice)
        try container.encodeIfPresent(self.observabilityPlan, forKey: .observabilityPlan)
        try container.encodeIfPresent(self.backgroundSound, forKey: .backgroundSound)
        try container.encodeIfPresent(self.hooks, forKey: .hooks)
        try container.encodeIfPresent(self.credentials, forKey: .credentials)
        try container.encodeIfPresent(self.voicemailDetection, forKey: .voicemailDetection)
        try container.encodeIfPresent(self.maxDurationSeconds, forKey: .maxDurationSeconds)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.edges, forKey: .edges)
        try container.encodeIfPresent(self.globalPrompt, forKey: .globalPrompt)
        try container.encodeIfPresent(self.server, forKey: .server)
        try container.encodeIfPresent(self.compliancePlan, forKey: .compliancePlan)
        try container.encodeIfPresent(self.analysisPlan, forKey: .analysisPlan)
        try container.encodeIfPresent(self.artifactPlan, forKey: .artifactPlan)
        try container.encodeIfPresent(self.startSpeakingPlan, forKey: .startSpeakingPlan)
        try container.encodeIfPresent(self.stopSpeakingPlan, forKey: .stopSpeakingPlan)
        try container.encodeIfPresent(self.monitorPlan, forKey: .monitorPlan)
        try container.encodeIfPresent(self.backgroundSpeechDenoisingPlan, forKey: .backgroundSpeechDenoisingPlan)
        try container.encodeIfPresent(self.credentialIds, forKey: .credentialIds)
        try container.encodeIfPresent(self.keypadInputPlan, forKey: .keypadInputPlan)
        try container.encodeIfPresent(self.voicemailMessage, forKey: .voicemailMessage)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case nodes
        case model
        case transcriber
        case voice
        case observabilityPlan
        case backgroundSound
        case hooks
        case credentials
        case voicemailDetection
        case maxDurationSeconds
        case id
        case orgId
        case createdAt
        case updatedAt
        case name
        case edges
        case globalPrompt
        case server
        case compliancePlan
        case analysisPlan
        case artifactPlan
        case startSpeakingPlan
        case stopSpeakingPlan
        case monitorPlan
        case backgroundSpeechDenoisingPlan
        case credentialIds
        case keypadInputPlan
        case voicemailMessage
    }
}