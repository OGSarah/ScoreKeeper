//
//  SettingsView.swift
//  ScoreKeeper
//
//  Created by Sarah Clark on 8/20/25.
//

import SwiftUI

struct SettingsView: View {
    @Binding var startingPoints: Int

    var body: some View {
        VStack(alignment: .leading) {
            Text("Game Rules")

            Divider()

            Picker("Start Points", selection: $startingPoints) {
                Text("0 starting points")
                    .tag(0)
                Text("10 starting points")
                    .tag(10)
                Text("20 starting points")
                    .tag(20)
            }
        }
        .padding()
        .background(.thinMaterial, in: .rect(cornerRadius: 10.0))
    }

}

// MARK: - Previews
#Preview("Dark Mode") {
    @Previewable @State var startingPoints = 10
    SettingsView(startingPoints: $startingPoints)
        .preferredColorScheme(.dark)
}

#Preview("Light Mode") {
    @Previewable @State var startingPoints = 10
    SettingsView(startingPoints: $startingPoints)
        .preferredColorScheme(.light)
}
