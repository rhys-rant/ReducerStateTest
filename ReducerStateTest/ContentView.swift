//
//  ContentView.swift
//  ReducerStateTest
//
//  Created by Rhys Morgan on 09/09/2022.
//

import ComposableArchitecture
import SwiftUI

struct ContentView: View {
	let store: Store<AppState, AppAction>

	var body: some View {
		NavigationView {
			WithViewStore(store) { viewStore in
				VStack {
					Group {
						if viewStore.loggedIn {
							Text("Logged In")
						} else {
							Text("Logged Out")
						}
					}

					Spacer()

					Text(viewStore.title)

					Spacer()

					Button("Initialise") {
						viewStore.send(.initialise)
					}

					Button("Change Login Status") {
						viewStore.send(.toggleLogin, animation: .default)
					}
				}
				.buttonStyle(.bordered)
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView(
			store: Store(
				initialState: AppState(loggedIn: false),
				reducer: .app,
				environment: ()
			)
		)
    }
}
