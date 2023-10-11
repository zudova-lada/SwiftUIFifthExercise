//
//  ContentView.swift
//  SwiftUIFifthExercise
//
//  Created by Лада Зудова on 11.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var rectPosition = CGPoint(x: 200, y: 50)
    
    private var square: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 100, height: 100)
            .position(rectPosition)
            .offset(y: 50)
            .gesture(DragGesture().onChanged({ value in
                rectPosition = value.location
            }))
    }
    
    var body: some View {
        VStack{
            ZStack(alignment: .top) {
                Rectangle()
                    .fill(.white)
                    .frame(width: 400, height: 220)
                    .position(CGPoint(x: 196.5, y: 110))
                Color
                    .pink
                    .frame(width: 400, height: 220)
                    .position(CGPoint(x: 196.5, y: 330))
                Color
                    .yellow
                    .frame(width: 400, height: 220)
                    .position(CGPoint(x: 196.5, y: 550))
                Color
                    .black
                    .frame(width: 400, height: 220)
                    .position(CGPoint(x: 196.5, y: 770))
                square
                    .foregroundColor(.white)
                    .blendMode(.difference)
                    .overlay(square.blendMode(.hue))
                    .overlay(square.foregroundColor(.white)
                        .blendMode(.overlay))
                    .overlay(square.foregroundColor(.black)
                        .blendMode(.overlay))
            }
            .background(.clear)
            .compositingGroup()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.clear)
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
