//
//  UISliderRepresentation.swift
//  CheckMeSwiftUI
//
//  Created by Tatevik Khunoyan on 24.10.2023.
//
import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
   
    @Binding var value: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.changeSlider),
            for: .editingChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = UIColor.red.withAlphaComponent(CGFloat(value))
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension UISliderRepresentation {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func changeSlider(_ sender: UISlider){
            value = Double(sender.value)
        }
    }
}

struct UISliderRepresentation_Previews: PreviewProvider {
    static var previews: some View {
        UISliderRepresentation(value: .constant(0.5))
    }
}
