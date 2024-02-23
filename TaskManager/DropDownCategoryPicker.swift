//
//  DropDownCategoryPicker.swift
//  TaskManager
//
//  Created by Isabella Sulisufi on 23/02/2024.
//

import SwiftUI

struct DropDownCategoryPicker: View {
    
    @State var selection1: String? = nil
    
    var body: some View {
            DropDownPicker(
                selection: $selection1,
                options: [
                    "School",
                    "Work",
                    "Personal",
                    "Fitness",
                ]
            )
    }
}

enum DropDownPickerState {
    case top
    case bottom
}

struct DropDownPicker: View {
    
    @Binding var selection: String?
    var state: DropDownPickerState = .bottom
    var options: [String]
    var maxWidth: CGFloat = 180
    
    @State var showDropdown = false
    
    @SceneStorage("drop_down_zindex") private var index = 1000.0
    @State var zindex = 1000.0
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            VStack(spacing: 0) {
                
                if state == .top && showDropdown {
                    OptionsView()
                }
                
                HStack {
                    Text(selection == nil ? "Select" : selection!)
                        .foregroundColor(selection != nil ? Color.darkPurple : Color.cPurple)
                        .font(.custom("NotoSansOriya", size: Spacing.medium))

                    Spacer(minLength: 0)
                    
                    Image(systemName: state == .top ? "chevron.up" : "chevron.down")
                        .font(.title3)
                        .foregroundColor(Color.cPurple)
                        .rotationEffect(.degrees((showDropdown ? -180 : 0)))
                }
                .padding(.horizontal, 15)
                .frame(width: 180, height: 50)
                .background(Color.cream)
                .contentShape(.rect)
                .onTapGesture {
                    index += 1
                    zindex = index
                    withAnimation(.snappy) {
                        showDropdown.toggle()
                    }
                }
                .zIndex(10)
                
                if state == .bottom && showDropdown {
                    OptionsView()
                }
            }
            .clipped()
            .background(Color.cream)
            .cornerRadius(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.cPurple)
            }
            .frame(height: size.height, alignment: state == .top ? .bottom : .top)
            
        }
        .frame(width: maxWidth, height: 50)
        .zIndex(zindex)
    }
    
    
    func OptionsView() -> some View {
        VStack(spacing: 0) {
            ForEach(options, id: \.self) { option in
                HStack {
                    Text(option)
                        .font(.custom("NotoSansOriya", size: Spacing.medium))

                    Spacer()
                    Image(systemName: "checkmark")
                        .opacity(selection == option ? 1 : 0)
                }
                .foregroundStyle(selection == option ? Color.darkPurple : Color.cPurple)
                .animation(.none, value: selection)
                .frame(height: 40)
                .contentShape(.rect)
                .padding(.horizontal, 15)
                .onTapGesture {
                    withAnimation(.snappy) {
                        selection = option
                        showDropdown.toggle()
                    }
                }
            }
        }
        .transition(.move(edge: state == .top ? .bottom : .top))
        .zIndex(1)
    }
}
