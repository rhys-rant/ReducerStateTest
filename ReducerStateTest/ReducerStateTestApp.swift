//
//  ReducerStateTestApp.swift
//  ReducerStateTest
//
//  Created by Rhys Morgan on 09/09/2022.
//

import ComposableArchitecture
import SwiftUI

@main
struct ReducerStateTestApp: App {
    var body: some Scene {
        WindowGroup {
			ContentView(
				store: Store(
					initialState: AppState(loggedIn: false),
					reducer: .empty,
					environment: ()
				)
			)
        }
    }
}
