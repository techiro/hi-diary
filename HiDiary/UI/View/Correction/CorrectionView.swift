//
//  CorrectionView.swift
//  HiDiary
//
//  Created by arakawaLab on 2021/08/25.
//

import SwiftUI

struct CorrectionView: View {
    
    @State private var content = ""
    private static let placeholder = "思ったことを書いてみよう"
    @State private var placeholderText = placeholder
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                Text("UserName")
                
                Spacer()
                
            }
            .padding(20)
            
            HStack{
                Text("Time")
                
                Spacer().frame(width:300)
            }
            
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder().foregroundColor(.gray)
                    .background(Color.clear)
                TextEditor(text: $content)
                    .padding()
                    .foregroundColor(.black)
                    .onTapGesture {
                        if content.isEmpty {
                            placeholderText = ""
                        }
                    }
                    .onChange(of: content) { value in
                        if content.isEmpty {
                            placeholderText = Self.placeholder
                        } else {
                            placeholderText = ""
                        }
                    }
                Text(placeholderText)
                    .padding()
                    .foregroundColor(.gray)
            }
            .frame(width: 370, height: 338, alignment: .center)
            .background(Color.white)
            
            VStack{
                HStack{
                    Text("コメント")
                    
                    Spacer().frame(width: 280)
                }
                
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder().foregroundColor(.gray)
                        .background(Color.clear)
                    TextEditor(text: $content)
                        .padding()
                        .foregroundColor(.black)
                        .onTapGesture {
                            if content.isEmpty {
                                placeholderText = ""
                            }
                        }
                        .onChange(of: content) { value in
                            if content.isEmpty {
                                placeholderText = Self.placeholder
                            } else {
                                placeholderText = ""
                            }
                        }
                    Text(placeholderText)
                        .padding()
                        .foregroundColor(.gray)
                        .font(.footnote)
                }
                .frame(width: 370, height: 55, alignment: .center)
                .background(Color.white)
                
            }
        }
        .background(Color.background)
        
    }
}

struct CorrectionView_Previews: PreviewProvider {
    static var previews: some View {
        CorrectionView()
    }
}
