//
//  AppearanceSelectionPicker.swift
//  SwitchToTheDarkSide
//
//  Created by Jet Lye on 15/10/2023.
//

import SwiftUI

struct AppearanceSelectionPicker: View {
    @EnvironmentObject var appearanceManager: AppearanceManager

    var body: some View {
        List {
            ForEach(Appearance.allCases, id: \.self) { appearance in
                Button(action: {
                    appearanceManager.selectedAppearance = appearance
                }) {
                    HStack {
                        Text(appearance.rawValue)
                        Spacer()
                        if appearance == appearanceManager.selectedAppearance {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                    }
                }
                .foregroundColor(.primary)
            }
        }
        
        HStack {
            Text("Appearance")
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            Picker(selection: $appearanceManager.selectedAppearance, label: Text("Appearance")) {
                ForEach(Appearance.allCases, id: \.self) { appearance in
                    Text(appearance.rawValue)
                        .tag(appearance)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 150, height: 50, alignment: .center)
            .padding()
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .introspectUIPickerView { picker in
                picker.subviews[1].backgroundColor = UIColor.clear
            }
        }
        .padding()

        .onChange(of: appearanceManager.selectedAppearance, perform: { value in
            appearanceManager.applyAppearanceStyle(value)
        })
        .onAppear {
            appearanceManager.setInitialSelectedAppearance()
        }
    }
}

