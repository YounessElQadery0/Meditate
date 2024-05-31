//
//  HomeView.swift
//  Stilleye
//
//  Created by Youness Qadery on 6/3/2024.
//

import SwiftUI

struct HomePageView: View {
    @State private var isMeditationPresented = false
    @State private var isRelaxPresented = false
    @State private var isFocusPresented = false
    @State private var rotationAngle: Double = 0.0

    var body: some View {
        ZStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.white.opacity(0.2)]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea(.all)
                    .rotationEffect(Angle(degrees: -rotationAngle))
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.4), Color.purple.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
                    .rotationEffect(Angle(degrees: -rotationAngle))
            }
                ZStack{
                    Circle()
                        .frame(width: 600, height: 600)
                        .offset(x: 300,y: -300)
                        .foregroundColor(.purple.opacity(0.5))
                        .blur(radius: 8)
                    Circle()
                        .frame(width: 600, height: 600)
                        .foregroundColor(.blue.opacity(0.5))
                        .blur(radius: 8)
                    Circle()
                        .frame(width: 600, height: 600)
                        .offset(x: -300,y: 300)
                        .foregroundColor(.purple.opacity(0.5))
                        .blur(radius: 8)
                }
                .ignoresSafeArea(.all)
            
            
            VStack {
                
                
                Button(action: {
                    isRelaxPresented.toggle()
                }) {
                  
                    ZStack {
                        Color.white.opacity(0.5)
                            .frame(width: 300, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .shadow(color: .black.opacity(0.1), radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 10)
                        
                        Text("Relax")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .foregroundColor(Color.black.opacity(0.8))
                    }
                }
                .rotationEffect(Angle(degrees: -rotationAngle))
                .fullScreenCover(isPresented: $isRelaxPresented, content: {
                    RainbowCircleView()
                })
                .padding(.bottom,55)
                
                
                Button(action: {
                    isFocusPresented.toggle()
                }) {
                 
                    ZStack {
                        Color.white.opacity(0.5)
                            .frame(width: 300, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .shadow(color: .black.opacity(0.1), radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 10)
                        
                        Text("Focus")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .foregroundColor(Color.black.opacity(0.8))
                    }
                }
                .rotationEffect(Angle(degrees: -rotationAngle))
                .fullScreenCover(isPresented: $isFocusPresented, content: {
                    FocusView()
                })
                .padding(.vertical,55)
                
                
                Button(action: {
                    isMeditationPresented.toggle()
                }) {
                    ZStack {
                        Color.white.opacity(0.5)
                            .frame(width: 300, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .shadow(color: .black.opacity(0.1), radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 10)
                        
                        Text("Meditation")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .foregroundColor(Color.black.opacity(0.8))
                    }
                }
                .rotationEffect(Angle(degrees: -rotationAngle))
                .fullScreenCover(isPresented: $isMeditationPresented, content: {
                    MeditationView()
                        
                })
                .padding(.top,55)
            }
        }
        .ignoresSafeArea(.all)
        .rotationEffect(Angle(degrees: rotationAngle))
      //  .background(Image("back3"))
        .onAppear {
            NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: nil, queue: .main) { _ in
                updateRotationAngle()
            }
        }
        
    }
    private func updateRotationAngle() {
        let deviceOrientation = UIDevice.current.orientation
        switch deviceOrientation {
        case .landscapeRight:
            rotationAngle = 90.0
        case .landscapeLeft :
            rotationAngle = -90.0
        case .portrait, .unknown, .portraitUpsideDown:
            rotationAngle = 0.0
        case .faceDown, .faceUp:
            break // Ignore face-up and face-down orientations
        @unknown default:
            break
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
