//
//  ContentView.swift
//  SideBar
//
//  Created by Rizwan on 16/04/21.
//

import SwiftUI

struct ContentView: View {

    // MARK:- Properties

    @State var preferredColorScheme: ColorScheme = .light
    @State var hideButton: Bool = false

    // MARK:- View

    var body: some View {
        VStack {
            HStack {
                if !hideButton {
                    Spacer()
                    Button(action: {
                        toggleBackground()
                    }) {
                        if preferredColorScheme == .light {
                            Image(systemName: "moon.fill")
                                .font(.title2)
                                .foregroundColor(.black).opacity(0.8)
                        }
                        else {
                            Image(systemName: "sun.max.fill")
                                .font(.title)
                                .foregroundColor(.white).opacity(0.8)
                               // .padding(5)
                        }
                    }
                }
            }
            .padding()
            Spacer()
        }
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: 0,
               maxHeight: .infinity,
               alignment: .topLeading
        )
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation {
                hideButton.toggle()
            }
        }
        .preferredColorScheme(preferredColorScheme)
    }

    // MARK:- Actions

    private func toggleBackground() {
        if preferredColorScheme == .light {
            preferredColorScheme = .dark
        }
        else {
            preferredColorScheme = .light
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
            
    }
}
