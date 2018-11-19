//
//  CryingDetectionServiceMock.swift
//  Baby MonitorTests
//

import Foundation
import RxSwift
@testable import BabyMonitor

final class CryingDetectionServiceMock: CryingDetectionServiceProtocol {
    
    lazy var cryingDetectionObservable: Observable<Bool> = cryingDetectionPublisher.asObservable()
    var cryingDetectionPublisher = PublishSubject<Bool>()
    var analysisStarted = false
    
    func startAnalysis() {
        analysisStarted = true
    }
    
    func stopAnalysis() {
        analysisStarted = false
    }
    
    func notifyAboutCryingDetection(isBabyCrying isCrying: Bool) {
        cryingDetectionPublisher.onNext(isCrying)
    }
}
