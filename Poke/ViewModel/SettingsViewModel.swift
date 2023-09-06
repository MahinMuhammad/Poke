//
//  SettingsViewModel.swift
//  Poke
//
//  Created by Md. Mahinur Rahman on 9/6/23.
//

import Foundation

final class SettingsViewModel:ObservableObject{
    @Published var isActiveStatusOn = false
    @Published var shakeToReport = false
    @Published var isNotificationOn = false
    @Published var showRemoveAllNewsAlert = false
    @Published var showProfileView = false
}
