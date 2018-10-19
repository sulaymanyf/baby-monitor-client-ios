//
//  AppDependencies.swift
//  Baby Monitor
//

import Foundation
import RTSPServer

struct AppDependencies {
    
    /// Media player for getting and playing video baby stream
    private(set) lazy var mediaPlayer: MediaPlayerProtocol = VLCMediaPlayerService(netServiceClient: netServiceClient, rtspConfiguration: rtspConfiguration)
    /// Media player for streaming video
    private(set) lazy var mediaPlayerStreamingService: VideoStreamingService = MediaPlayerStreamingService(netServiceServer: netServiceServer, cameraServer: cameraServer)
    
    private(set) lazy var netServiceClient: NetServiceClientProtocol = NetServiceClient()
    private lazy var netServiceServer: NetServiceServerProtocol = NetServiceServer()
    private lazy var cameraServer: CameraServerProtocol = CameraServer().server()
    
    private(set) lazy var rtspConfiguration: RTSPConfiguration = UserDefaultsRTSPConfiguration()
}
