//
//  ContentView.swift
//  Memorize
//
//  Created by Chris Jackson on 10/18/23.
//

import SwiftUI

//View that will hold literally everything. Instantiate CardView here by using ForEach loop
struct ContentView: View {
	let emojis = ["🤣","🤷🏾‍♂️","🥰","🥳", "😌", "😘", "🥶", "🫥", "🤗", "🤠", "🤥", "🤧"]
	
	var body: some View {
		VStack {
			ScrollView {
				cards
			}
			Spacer()
			themeButtons
		}
		.padding()
	}
	
	var cards: some View {
		LazyVGrid(columns: [GridItem(.adaptive(minimum: 65)), GridItem(.adaptive(minimum: 65)), GridItem(.adaptive(minimum: 65)), GridItem(.adaptive(minimum: 65)), GridItem(.adaptive(minimum: 65))]) {
			ForEach(0..<emojis.count, id:\.self) { index in
				CardView(content: emojis[index])
					.aspectRatio(2/3, contentMode: .fit)
			}
		}
		.foregroundColor(.red)
		.padding()
	}
	
	func changeTheme(theme: Int, symbol: String) -> some View {
		Button(action: {
			//update emojis
		}, label: {
				Image(systemName: symbol)
		})
	}
	
	var theme1: some View {
		//FIXME: add actual system image for the symbol
		changeTheme(theme: 0, symbol: "globe")
	}
	
	var theme2: some View {
		changeTheme(theme: 1, symbol: "globe")
	}
	
	var theme3: some View {
		changeTheme(theme: 2, symbol: "globe")
	}
	
	var themeButtons: some View {
		HStack {
			theme1
			Spacer()
			theme2
			Spacer()
			theme3
		}
		.imageScale(.large)
		.font(.largeTitle)
	}
}

struct CardView: View {
	@State var isFaceUp = false
	let content: String
	
	var body: some View {
		ZStack {
			let base = RoundedRectangle(cornerRadius: 12)
			Group {
				base.foregroundColor(.white)
				base.strokeBorder(lineWidth: 2)
				Text(content).font(.largeTitle)
			}
			.opacity(isFaceUp ? 1 : 0)
			base.fill().opacity(isFaceUp ? 0 : 1)
		}
		.onTapGesture {
			isFaceUp.toggle()
		}
	}
}

#Preview {
	ContentView()
}
