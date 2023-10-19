//
//  ContentView.swift
//  Memorize
//
//  Created by Chris Jackson on 10/18/23.
//

import SwiftUI

struct ContentView: View {
	@State var activeEmojiSet: Array<String> = []
	let vehicleEmojis = ["✈️","🚀","🚗","🚘","🚘","🚀","🛫","🚗","🛫","✈️"]
	let techEmojis = ["📱","💻","⌨️","📱","📡","💻","⌨️","📡"]
	let randomEmojis = ["🤣","🤷🏾‍♂️","🤷🏾‍♂️","🥳", "🤣", "😘", "🥶", "😘", "🥶", "🥳", "🤥", "🤥"]
	
	var body: some View {
		VStack {
			Text("Memorize!").font(.largeTitle)
			cards
			Spacer()
			themeButtons
		}
		.padding()
	}
	
	var cards: some View {
		LazyVGrid(columns: [GridItem(.adaptive(minimum: 65)), GridItem(.adaptive(minimum: 65)), GridItem(.adaptive(minimum: 65)), GridItem(.adaptive(minimum: 65)), GridItem(.adaptive(minimum: 65))]) {
			ForEach(0..<activeEmojiSet.count, id:\.self) { index in
				CardView(content: activeEmojiSet[index])
					.aspectRatio(2/3, contentMode: .fit)
			}
		}
		.foregroundColor(.red)
		.padding()
	}
	
	func changeTheme(theme: Int, symbol: String, title: String) -> some View {
		VStack {
			Button(action: {
				switch theme {
				case 0 :
					activeEmojiSet = vehicleEmojis
				case 1 :
					activeEmojiSet = techEmojis
				case 2 :
					activeEmojiSet = randomEmojis
				default:
					print("An error has occurred")
				}
				activeEmojiSet.shuffle()
			}, label: {
				Image(systemName: symbol)
			})
			Text(title)
				.foregroundStyle(Color.accentColor)
				.font(.footnote)
		}
	}
	
	var vehicleTheme: some View {
		changeTheme(theme: 0, symbol: "car", title: "Vehicles")
	}
	
	var techTheme: some View {
		changeTheme(theme: 1, symbol: "desktopcomputer", title: "Tech")
	}
	
	var randomTheme: some View {
		changeTheme(theme: 2, symbol: "shuffle", title: "Random")
	}
	
	var themeButtons: some View {
		HStack(spacing: 50) {
			vehicleTheme
			techTheme
			randomTheme
		}
		.imageScale(.large)
		.font(.title2)
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
