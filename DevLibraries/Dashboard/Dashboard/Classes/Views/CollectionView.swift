//
//  CollectionView.swift
//  Dashboard
//
//  Created by Rystem Asqar on 4/16/24.
//

import SwiftUI

struct customShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
}

struct CollectionView: View {
    let items = Array(1...7) // Example data
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ZStack {
                Color("background")
                HStack(spacing: 10) {
                    ForEach(items, id: \.self) { item in
                        CustomCell(number: item)
                    }
                }
                .padding()
            }
        } .background(Color("background"))
    }
}

struct CustomCell: View {
    let number: Int
    let array = ["Участковый \nврач", "Активные \nнаправление", "Платные \nуслуги", "Поиск \nлекарства", "Личные \nданные", "Анализы", "Техническая \nподдержка"]
    var body: some View {
        ZStack {
            Color.white
                .shadow(radius: 10)
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            VStack {
                Image("\(number)")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .modifier(customShadow())
                Text("\(array[number-1])")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .lineLimit(2)
                    .font(.system(size: 12))
            }
        }
    }
}

#Preview {
    CollectionView()
}

