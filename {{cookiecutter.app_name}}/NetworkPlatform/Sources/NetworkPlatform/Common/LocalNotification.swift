//
//  LocalNotification.swift
//  NetworkPlatform
//
//  Created by {{ cookiecutter.creator }} on {% now 'utc', '%d/%m/%Y' %}.
//  Copyright © {% now 'utc', '%Y' %} {{cookiecutter.company_name}}. All rights reserved.
//

import Combine
import Foundation

// https://stackoverflow.com/questions/58559908/combine-going-from-notification-center-addobserver-with-selector-to-notificatio

class NetworkLoadingNotificationSender {
    var loading: Bool

    init(_ loadingToSend: Bool) {
        loading = loadingToSend
    }

    static let notification = Notification.Name("NetworkLoadingNotification")
}

class NetworkInfoNotificationSender {
    var message: String

    init(_ messageToSend: String) {
        message = messageToSend
    }

    static let notification = Notification.Name("NetworkPopupNotification")
}
