//
//  CameraPreviewView.swift
//  Baby Monitor
//

import UIKit
import RxCocoa
import RxSwift

final class CameraPreviewView: BaseView {
    
    let mediaView = RTCEAGLVideoView()
    let babyNavigationItemView = BabyNavigationItemView(mode: .parent)
    let cancelItemButton = UIBarButtonItem(image: #imageLiteral(resourceName: "arrowBack"),
                                           style: .plain,
                                           target: nil,
                                           action: nil)
    
    override init() {
        super.init()
        setup()
    }
    
    func setupOnLoadingView() {
        babyNavigationItemView.setupPhotoImageView()
    }
    
    // MARK: - Private functions
    private func setup() {
        backgroundColor = .gray
        addSubview(mediaView)
        mediaView.addConstraints { $0.equalSafeAreaEdges() }
    }
}

extension Reactive where Base: CameraPreviewView {
    var babyName: Binder<String> {
        return Binder(base.babyNavigationItemView, binding: { navigationView, name in
            navigationView.updateBabyName(name)
        })
    }
    
    var babyPhoto: Binder<UIImage> {
        return Binder(base.babyNavigationItemView, binding: { navigationView, photo in
            navigationView.updateBabyPhoto(photo)
        })
    }
}
