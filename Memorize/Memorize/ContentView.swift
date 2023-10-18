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
