//
//  AppFeature.swift
//  ReducerStateTest
//
//  Created by Rhys Morgan on 09/09/2022.
//

import ComposableArchitecture
import Foundation

struct AppState: Equatable {
	var loggedIn: Bool
	var title = "No Title"
}

enum AppAction {
	case initialise
	case toggleLogin
}

extension Reducer where State == AppState, Action == AppAction, Environment == Void {
	static let app = Self { state, action, environment in
		if action == .toggleLogin {
			state.loggedIn.toggle()
			return .none
		}

		if state.loggedIn {
			return Reducer.loggedIn(&state, action, environment)
		} else {
			return Reducer.loggedOut(&state, action, environment)
		}
	}

	static let loggedIn = Self { state, action, _ in
		switch action {
		case .initialise:
			state.title = "Initialised using the loggedIn Reducer"
			return .none

		default:
			return .none
		}
	}

	static let loggedOut = Self { state, action, _ in
		switch action {
		case .initialise:
			state.title = "Initialised using the loggedOut Reducer"
			return .none

		default:
			return .none
		}
	}
}
