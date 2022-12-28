//
//  SelectedScreen.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import SwiftUI
import PhotosUI

struct Line {
    var points = [CGPoint]()
    var color: Color = .red
    var lineWidth: Double = 1.0
}
@available(iOS 16.0, *)
struct SelectedScreen: View {
    var state: DrawSelectedState
    var viewModel: DrawViewModel
    @State private var currentLine = Line()
    @State private var lines: [Line] = []
    @State private var selectedColor: Color = .red
    @State private var thickness: Double = 5.0
    func onGestureChanged(value: DragGesture.Value){
        let newPoint = value.location
        currentLine.points.append(newPoint)
        self.lines.append(currentLine)
    }
    func onGestureEnded(){
        self.lines.append(currentLine)
        self.currentLine = Line(points: [], color: selectedColor, lineWidth: thickness)
    }
    var body: some View {
        VStack {
            Canvas { context, size in
                context.draw(Image(uiImage: UIImage(data: state.data)!).resizable(), in: CGRect(origin: .zero, size: size))
                for line in lines {
                    var path = Path()
                    path.addLines(line.points)
                    context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                }

            }.frame(minWidth: 400, minHeight: 400).gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .onChanged(onGestureChanged)
                .onEnded({ value in onGestureEnded()}))
            HStack {
                Slider(value: $thickness, in: 1...20) {
                    Text("Thickness")
                }.frame(maxWidth: 200).onChange(of: thickness) { newValue in currentLine.lineWidth = newValue }
                Divider()
                ColorPickerView(selectedColor: $selectedColor)
                        .onChange(of: selectedColor) { newColor in currentLine.color = newColor }
            }

            BackgroundButton(title: "Cancel") {
                viewModel.cancelSelection()
            }
        }
    }
}
