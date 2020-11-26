import Foundation
import UIKit

public typealias AppStateEventHandler = (AppStateObserver.AppState) -> Void

public final class AppStateObserver {
    
    public enum AppState: String, Equatable {
        case didBecomeActive = "didBecomeActive"
        case willResignActive = "willResignActive"
        case willEnterForeground = "willEnterForeground"
        case didEnterBackground = "didEnterBackground"
        case willTerminate = "willTerminate"
        
        fileprivate func post() {
            AppStateObserver.shared.notificationCenter.post(name: AppStateObserver.shared.notificationName, object: nil, userInfo: [AppStateObserver.shared.notificationStatusInfo: self])
        }
    }
    
    private init() {
        NotificationCenter.default.addObserver(self, selector: #selector(received(notification:)), name: UIApplication.didBecomeActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(received(notification:)), name: UIApplication.willResignActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(received(notification:)), name: UIApplication.willEnterForegroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(received(notification:)), name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(received(notification:)), name: UIApplication.willTerminateNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    public static let shared: AppStateObserver = AppStateObserver()
    
    fileprivate var disposeBagSet: Set<AppStateDisposeBag> = Set<AppStateDisposeBag>()
    fileprivate var notificationNameRawValue: String = "com.nib.appobserver.status.event.notification"
    fileprivate var notificationStatusInfo: String = "com.nib.appobserver.status.event.status"
    fileprivate let notificationCenter: NotificationCenter = NotificationCenter()
    fileprivate var notificationName: Notification.Name { Notification.Name(rawValue: notificationNameRawValue) }
    
    @discardableResult
    public static func subscribe(_ handler: @escaping AppStateEventHandler) -> AppStateDisposeBag {
        let disposeBag = AppStateDisposeBag(handler)
        shared.disposeBagSet.insert(disposeBag)
        shared.notificationCenter.addObserver(disposeBag, selector: #selector(disposeBag.received(_:)), name: shared.notificationName, object: nil)
        return disposeBag
    }
    
    @objc private func received(notification: Notification) {
        switch notification.name {
        case UIApplication.didBecomeActiveNotification:
            AppState.didBecomeActive.post()
        case UIApplication.willResignActiveNotification:
            AppState.willResignActive.post()
        case UIApplication.willEnterForegroundNotification:
            AppState.willEnterForeground.post()
        case UIApplication.didEnterBackgroundNotification:
            AppState.didEnterBackground.post()
        case UIApplication.willTerminateNotification:
            AppState.willTerminate.post()
        default:
            break
        }
    }
}

public class AppStateDisposeBag: NSObject {
    
    private weak var observer: AppStateObserver?
    private var handler: AppStateEventHandler?
    
    fileprivate init(_ handler: @escaping AppStateEventHandler) {
        self.observer = AppStateObserver.shared
        self.handler = handler
    }
    
    @objc fileprivate func received(_ notification: Notification) {
        guard let userInfo = notification.userInfo, let state = userInfo[AppStateObserver.shared.notificationStatusInfo] as? AppStateObserver.AppState else { return }
        handler?(state)
    }
    
    public func dispose() {
        self.observer?.disposeBagSet.remove(self)
        AppStateObserver.shared.notificationCenter.removeObserver(self, name: AppStateObserver.shared.notificationName, object: nil)
        self.observer = nil
        self.handler = nil
    }
}
