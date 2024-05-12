//
//  RadioGroup.swift
//  UrbaneTrenz
//
// Code modified from "https://farhanadji.medium.com/easy-steps-to-create-custom-radio-button-in-swiftui-97c789ec17e6"

import SwiftUI

struct RadioButton: View {
    @Binding private var isSelected: Bool
    private let label: String
    private let image: String
    private var isDisabled: Bool = false
    
    init<V: Hashable>(tag: V, selection: Binding<V>, label: String = "", image: String = "") {
        self._isSelected = Binding(
            get: { selection.wrappedValue == tag },
            set: { _ in selection.wrappedValue = tag }
        )
        self.label = label
        self.image = image
    }
    
    init<V: Hashable>(tag: V, selection: Binding<V>, label: String = "") {
        self._isSelected = Binding(
            get: { selection.wrappedValue == tag },
            set: { _ in selection.wrappedValue = tag }
        )
        self.label = label
        self.image = ""
    }

    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            circleView
            imageView
            labelView
        }
        .contentShape(Rectangle())
        .onTapGesture { isSelected = true }
        .disabled(isDisabled)
    }
}

private extension RadioButton {
      @ViewBuilder var labelView: some View {
          if !label.isEmpty { // Show label if label is not empty
            Text(label)
              .foregroundColor(labelColor)
          }
      }
    
    @ViewBuilder var imageView: some View {
        if !image.isEmpty { // Show label if label is not empty
            Image(image)
                .resizable()
                .frame(width: 50, height: 30)
                .border(.gray, width: 1)
        }
    }
  
  @ViewBuilder var circleView: some View {
     Circle()
       .fill(innerCircleColor) // Inner circle color
       .padding(4)
       .overlay(
          Circle()
            .stroke(outlineColor, lineWidth: 1)
        ) // Circle outline
       .frame(width: 20, height: 20)
  }
}

private extension RadioButton {
   var innerCircleColor: Color {
      guard isSelected else { return Color.clear }
      if isDisabled { return Color.gray.opacity(0.6) }
      return Color.black
   }

   var outlineColor: Color {
      if isDisabled { return Color.gray.opacity(0.6) }
      return isSelected ? Color.black : Color.gray
   }

   var labelColor: Color {
      return isDisabled ? Color.gray.opacity(0.6) : Color.black
   }
}

extension RadioButton {
  func disabled(_ value: Bool) -> Self {
     var view = self
     view.isDisabled = value
     return view
  }
}
