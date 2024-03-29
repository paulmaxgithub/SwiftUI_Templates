//
//  LocalNotification_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 22.02.23.
//

import SwiftUI
import UserNotifications
import CoreLocation

fileprivate class NotificationManager {
    
    enum NotificationTrigger { case time, calendar, location }
    
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        UNUserNotificationCenter.current()
            .requestAuthorization(options: options) { isAuthorized, error in
                if let error = error {
                    fatalError("Request Error - \(error.localizedDescription)")
                } else if isAuthorized {
                    print("ALLOWED ✅")
                } else {
                    print("NOT ALLOWED ❌")
                }
            }
    }
    
    public func scheduleNotification(by trigger: NotificationTrigger) {
        let content = UNMutableNotificationContent()
        content.title = "First Notification))"
        content.subtitle = "Subtitle Info"
        content.sound = .default
        content.badge = 1
        
        ///time
        let timeTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        ///calendar
        let dateComponents = DateComponents(hour: 1, minute: 20)
        let calendarTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        ///location
        let coordinates = CLLocationCoordinate2D(latitude: 53.53, longitude: 27.4120)
        let region = CLCircularRegion(center: coordinates, radius: 100, identifier: UUID().uuidString)
        region.notifyOnEntry = true
        region.notifyOnExit = false
        let locationTrigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        let selectedTriggger: UNNotificationTrigger
        switch trigger {
        case .time:     selectedTriggger = timeTrigger
        case .calendar: selectedTriggger = calendarTrigger
        case .location: selectedTriggger = locationTrigger
        }

        let request = UNNotificationRequest(
            identifier: UUID().uuidString, content: content, trigger: selectedTriggger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    public func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

struct LocalNotification_: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("Request permission") {
                NotificationManager.instance.requestAuthorization()
            }.buttonStyle(.borderedProminent)
            Button("Cancel notification") {
                NotificationManager.instance.cancelNotification()
            }.buttonStyle(.borderedProminent)
            
            Divider()
            
            Button("Schedule notification by time") {
                NotificationManager.instance.scheduleNotification(by: .time)
            }.buttonStyle(.borderedProminent)
            Button("Schedule notification by calendar") {
                NotificationManager.instance.scheduleNotification(by: .calendar)
            }.buttonStyle(.borderedProminent)
            Button("Schedule notification by location") {
                NotificationManager.instance.scheduleNotification(by: .location)
            }.buttonStyle(.borderedProminent)
                    }
        .onAppear {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

struct LocalNotification__Previews: PreviewProvider {
    static var previews: some View {
        LocalNotification_()
    }
}
