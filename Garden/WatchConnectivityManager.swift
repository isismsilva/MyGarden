//
//  WatchConnectivityManager.swift
//  Garden
//
//  Created by Isis Silva on 27/09/22.
//

import Foundation
import WatchConnectivity

class WatchConnectivityManager: NSObject, ObservableObject {
  
  static let shared = WatchConnectivityManager()
  @Published var notificationMessage: NotificationMessage? = nil
  
  let session = WCSession.default
  
  override init() {
    super.init()
    
    if WCSession.isSupported() {
      session.delegate = self
      session.activate()
    }
  }
  
  func send(_ message: String) {
    guard session.activationState == .activated else { return }
#if os(iOS)
    guard session.isWatchAppInstalled else { return }
#else
    guard session.isCompanionAppInstalled else { return }
#endif
    
    session.sendMessage(["message" : message], replyHandler: nil) { error in
      print(error)
    }
  }
  
}

extension WatchConnectivityManager: WCSessionDelegate {
  func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {}
  
  @MainActor
  func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
    if let notification = message["message"] as? String {
      self.notificationMessage = NotificationMessage(text: notification)
    }
  }
  
#if os(iOS)
  func sessionDidBecomeInactive(_ session: WCSession) {}
  
  func sessionDidDeactivate(_ session: WCSession) { session.activate() }
#endif
  
}

struct NotificationMessage: Identifiable {
  let id = UUID()
  let text: String
}
