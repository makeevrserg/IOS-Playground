//
//  ColorPickerView.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import Foundation
import SwiftUI

struct ColorPickerView: View {
    let colors = [Color.red, Color.orange, Color.green, Color.blue, Color.purple]
    @Binding var selectedColor: Color
    var body: some View {
        HStack {
            ForEach(colors, id: \.self) { color in
                Image(systemName: selectedColor == color ? Icons.recordCircleFill : Icons.circleFill)
                        .foregroundColor(color)
                        .font(.system(size: 16))
                        .clipShape(Circle())
                        .onTapGesture {
                            selectedColor = color
                        }
            }
        }
    }
}
