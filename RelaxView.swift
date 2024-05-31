
//
//  RelaxView.swift
//  Stilleye
//
//  Created by Youness Qadery on 6/3/2024.
//
import SwiftUI

struct RainbowCircleView: View {
    @State private var yOffset: CGFloat = 0
    @State private var isAnimating = false
    @State private var isYellow = false
    @State private var isBig = false
    @State private var colors: [Color] = [
        Color(red: 184/255, green: 208/255, blue: 0/255),
        Color(red: 176/255, green: 206/255, blue: 0/255),
        Color(red: 170/255, green: 204/255, blue: 0/255),
        Color(red: 0/255, green: 137/255, blue: 70/255),
        Color(red: 0/255, green: 147/255, blue: 60/255),
        Color(red: 0/255, green: 157/255, blue: 50/255),
        Color(red: 0/255, green: 175/255, blue: 40/255),
        Color(red: 137/255, green: 189/255, blue: 19/255),
        Color(red: 112/255, green: 178/255, blue: 33/255),
        Color(red: 85/255, green: 166/255, blue: 48/255),
        Color(red: 64/255, green: 157/255, blue: 60/255),
        Color(red: 43/255, green: 147/255, blue: 72/255),
        Color(red: 90/255, green: 255/255, blue: 0/255),
        Color(red: 120/255, green: 255/255, blue: 0/255),
        Color(red: 150/255, green: 255/255, blue: 0/255),
        Color(red: 180/255, green: 255/255, blue: 0/255),
        Color(red: 210/255, green: 255/255, blue: 0/255),
        Color(red: 21/255, green: 137/255, blue: 84/255),
        Color(red: 0/255, green: 127/255, blue: 95/255),
        Color(red: 0/255, green: 200/255, blue: 30/255),
        Color(red: 0/255, green: 210/255, blue: 25/255),
        Color(red: 30/255, green: 255/255, blue: 0/255),
        Color(red: 60/255, green: 255/255, blue: 0/255),
        Color(red: 240/255, green: 255/255, blue: 0/255),
        Color(red: 255/255, green: 255/255, blue: 0/255),
        Color(red: 0/255, green: 220/255, blue: 20/255),
        Color(red: 0/255, green: 230/255, blue: 15/255),
        Color(red: 0/255, green: 240/255, blue: 10/255),
        Color(red: 0/255, green: 250/255, blue: 5/255),
        Color(red: 0/255, green: 255/255, blue: 0/255)
    ]
    
    @State private var colorIndex: Int = 0
    @State private var isSessionRunning = false
    @State private var sessionDuration: Double = 5 // session default value
    @State private var animationAmount: CGFloat = 1.0
    @State private var timer: Timer?
    @State private var showSessionFinishMessage = false
    @State private var elapsedTime: Double = 0.0
    @State private var isMiddleButtonVisible = true
    @State private var shouldResetAnimation = false
    @State private var isViewVisible = false
    @State private var isUIVisible = true
    @State private var hasStartButtonClicked = false
    @Environment(\.dismiss) var dismiss
    @State private var isPresented = false
    @State private var isPresented1 = false
    @State private var isPresented2 = false
    
    // @State private var isAdditionalViewVisible = false
    
    enum SessionState {
        case initial, running, finished
    }
    
    @State private var sessionState: SessionState = .initial
    
    var body: some View {
        ZStack{
            ZStack {
                Rectangle()
                    .foregroundColor(.black)
                    .opacity(isYellow ? 1.0 : 0.0)
                
                    .ignoresSafeArea()
            }
            .background(   ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.white.opacity(0.2)]), startPoint: .top, endPoint: .bottom)
                
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.4), Color.purple.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
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
              
            })
            
            
            
            .ignoresSafeArea()
            //arrow and text
            VStack{
                HStack{
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName:"arrow.backward")
                            .padding()
                        
                            .foregroundColor(.blue)
                            .cornerRadius(10)
                            .padding(.leading,30)
                        
                    }
                    .font(.title)
                    Spacer()
                }
                .opacity(isUIVisible ? 1.0 : 0.0)
                
                HStack{
                    
                    ZStack{
         
                            VStack{
                                Text("""
                                   The best experience of your life  \\
                                    is just the start
                                """)
                                .foregroundStyle(Color.white)
                                    .font(.largeTitle)
                                    .font(.system(size: 24, weight:.bold, design: .rounded))
                                    .font(.largeTitle)
                                    .bold()
                                  
                                    .foregroundStyle(.black.opacity(0.8))
                                    .padding(.bottom)
                               
        Text("""
                                            Recommended : Try your session in a dark place, lasting at least 10 minutes.
                                """)
                                    .font(.footnote)
                                    .bold()
                                    .foregroundStyle(Color.white)
                            }
          
                    }
                    .opacity(isUIVisible ? 1.0 : 0.0)
                    .padding(.leading,40)
                    .padding(.top)
                    Spacer()
                }
                Spacer()
            }
            ZStack {
                
                
                VStack() {
                    Spacer()
                    HStack{
                        //minus button
                        Button(action: {
                            if sessionDuration > 1 {
                                sessionDuration -= 0.5
                            }
                        }) {
                            ZStack{
                                
                                Color.black.opacity(0.5)
                                    .frame(width: 50, height: 50)
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                    .shadow(color: .black.opacity(0.1), radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 10)
                                Image(systemName: "minus.circle")
                                    .resizable()
                                    .frame(width: 40,height: 40)
                                    .font(.largeTitle)
                                    .foregroundColor(.purple)
                            }
                        }
                        //time remaining
                        ZStack {
                            
                            
                            Color.black.opacity(0.5)
                                .frame(width: 150, height: 70)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                                .shadow(color: .black.opacity(0.1), radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 10)
                            Text(timeRemaining)
                                .foregroundColor(.white.opacity(0.9))
                                .font(.largeTitle)
                                .padding()
                                .bold()
                            
                            
                            
                        }
                        .padding(.horizontal,12)
                        
                        Button(action: {
                            sessionDuration += 0.5
                        }) {
                            ZStack{
                                
                                Color.black.opacity(0.5)
                                    .frame(width: 50, height: 50)
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                    .shadow(color: .black.opacity(0.1), radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 10)
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .frame(width: 40,height: 40)
                                    .font(.largeTitle)
                                    .foregroundColor(.purple)
                            }
                        }
                    }
                    .opacity(isUIVisible ? 1.0 : 0.0)
                    
                    ZStack {
                        
                        // Circle moving UP
                        ZStack {
                            //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
                            // the esential circle
                            Circle()
                                .foregroundColor(colors[(colorIndex + 14) % colors.count]) // Use (colorIndex + 2) instead of colorIndex
                                .frame(width: 400 * animationAmount, height: 400 * animationAmount)
                                .rotationEffect(.degrees(Double(colorIndex) * 10))
                                .overlay(
                                    
                                    Circle()
                                        .stroke(lineWidth: 10)
                                        .foregroundColor(.clear)
                                        .background(
                                            
                                            ZStack{
                                                
                                                Circle()
                                                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                                    .foregroundColor(colors[(colorIndex + 14) % colors.count]) // Use (colorIndex + 2) instead of colorIndex
                                                    .blur(radius: 5)
                                                //bluring circle edge
                                                Circle()
                                                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                                    .foregroundColor(colors[(colorIndex + 14) % colors.count]) // Use (colorIndex + 2) instead of colorIndex
                                                
                                                // circle cenctration not necessary just optional
                                                Circle()
                                                    .foregroundColor(.white)
                                                    .frame(width: 10)
                                                    .blur(radius: 5)
                                            }
                                            
                                            
                                        )
                                    
                                    
                                )
                                .opacity(isAnimating  ? 1.0 : 0.0) // Initial opacity is 0
                            Circle()
                                .foregroundColor(colors[(colorIndex + 12) % colors.count]) // Use (colorIndex + 2) instead of colorIndex
                                .frame(width: 360 * animationAmount, height: 360 * animationAmount)
                                .rotationEffect(.degrees(Double(colorIndex) * 10))
                                .overlay(
                                    
                                    Circle()
                                        .stroke(lineWidth: 10)
                                        .foregroundColor(.clear)
                                        .background(
                                            
                                            ZStack{
                                                Circle()
                                                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                                    .foregroundColor(colors[(colorIndex + 3) % colors.count])
                                                    .blur(radius: 5)
                                                //bluring circle edge
                                                Circle()
                                                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                                    .foregroundColor(colors[(colorIndex + 7) % colors.count])
                                                    .blur(radius: 5)
                                                
                                            }
                                            
                                            
                                        )
                                    
                                    
                                )
                                .opacity(isAnimating  ? 1.0 : 0.0) // Initial opacity is 0
                            Circle()
                                .foregroundColor(colors[(colorIndex + 2) % colors.count]) // Use (colorIndex + 2) instead of colorIndex
                                .frame(width: 320 * animationAmount, height: 320 * animationAmount)
                                .rotationEffect(.degrees(Double(colorIndex) * 10))
                                .overlay(
                                    
                                    Circle()
                                        .stroke(lineWidth: 10)
                                        .foregroundColor(.clear)
                                        .background(
                                            
                                            ZStack{
                                                Circle()
                                                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                                    .foregroundColor(colors[(colorIndex + 3) % colors.count])
                                                    .blur(radius: 5)
                                                //bluring circle edge
                                                Circle()
                                                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                                    .foregroundColor(colors[(colorIndex + 6) % colors.count])
                                                    .blur(radius: 5)
                                                
                                            }
                                            
                                            
                                        )
                                    
                                    
                                )
                                .opacity(isAnimating  ? 1.0 : 0.0) // Initial opacity is 0
                            Circle()
                                .foregroundColor(colors[(colorIndex + 6) % colors.count]) // Use (colorIndex + 2) instead of colorIndex
                                .frame(width: 280 * -animationAmount, height: 280 * -animationAmount)
                                .rotationEffect(.degrees(Double(colorIndex) * 10))
                                .overlay(
                                    
                                    Circle()
                                        .stroke(lineWidth: 10)
                                        .foregroundColor(.clear)
                                        .background(
                                            
                                            ZStack{
                                                Circle()
                                                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                                    .foregroundColor(colors[(colorIndex + 13) % colors.count])
                                                    .blur(radius: 5)
                                                //bluring circle edge
                                                Circle()
                                                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                                    .foregroundColor(colors[(colorIndex + 5) % colors.count])
                                                    .blur(radius: 5)
                                                
                                            }
                                            
                                            
                                        )
                                    
                                    
                                )
                                .opacity(isAnimating  ? 1.0 : 0.0) // Initial opacity is 0
                            
                            Circle()
                                .foregroundColor(colors[(colorIndex + 8) % colors.count]) // Use (colorIndex + 2) instead of colorIndex
                                .frame(width: 240 * animationAmount, height: 240 * animationAmount)
                                .rotationEffect(.degrees(Double(colorIndex) * 10))
                                .overlay(
                                    
                                    Circle()
                                        .stroke(lineWidth: 10)
                                        .foregroundColor(.clear)
                                        .background(
                                            
                                            ZStack{
                                                Circle()
                                                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                                    .foregroundColor(colors[(colorIndex + 7) % colors.count])
                                                    .blur(radius: 5)
                                                //bluring circle edge
                                                Circle()
                                                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                                    .foregroundColor(colors[(colorIndex + 4) % colors.count])
                                                    .blur(radius: 5)
                                                
                                            }
                                            
                                            
                                        )
                                    
                                    
                                )
                                .opacity(isAnimating  ? 1.0 : 0.0) // Initial opacity is 0
                            Circle()
                                .foregroundColor(colors[(colorIndex + 10) % colors.count]) // Use (colorIndex + 2) instead of colorIndex
                                .frame(width: 200 * -animationAmount, height: 200 * -animationAmount)
                                .rotationEffect(.degrees(Double(colorIndex) * 10))
                                .overlay(
                                    
                                    Circle()
                                        .stroke(lineWidth: 10)
                                        .foregroundColor(.clear)
                                        .background(
                                            
                                            ZStack{
                                                Circle()
                                                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                                    .foregroundColor(colors[(colorIndex + 10) % colors.count])
                                                    .blur(radius: 5)
                                                //bluring circle edge
                                                Circle()
                                                    .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                                                    .foregroundColor(colors[(colorIndex + 11) % colors.count])
                                                    .blur(radius: 5)
                                                
                                            }
                                            
                                            
                                        )
                                    
                                    
                                )
                                .opacity(isAnimating  ? 1.0 : 0.0) // Initial opacity is 0
                            Circle()
                                .foregroundColor(colors[(colorIndex + 12) % colors.count]) // Use (colorIndex + 2) instead of colorIndex
                                .frame(width: 160 * animationAmount, height: 160 * animationAmount)
                                .rotationEffect(.degrees(Double(colorIndex) * 10))
                                .overlay(
                                    
                                    Circle()
                                        .stroke(lineWidth: 10)
                                        .foregroundColor(.clear)
                                        .background(
                                            
                                            ZStack{
                                                Circle()
                                                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                                    .foregroundColor(colors[(colorIndex + 2) % colors.count])
                                                    .blur(radius: 5)
                                                //bluring circle edge
                                                Circle()
                                                    .stroke(style: StrokeStyle(lineWidth: 7, lineCap: .round, lineJoin: .round))
                                                    .foregroundColor(colors[(colorIndex + 2) % colors.count])
                                                    .blur(radius: 5)
                                                
                                            }
                                            
                                            
                                        )
                                    
                                    
                                )
                                .opacity(isAnimating  ? 1.0 : 0.0) // Initial opacity is 0
                            Circle()
                                .foregroundColor(colors[(colorIndex + 3) % colors.count]) // Use (colorIndex + 2) instead of colorIndex
                                .frame(width: 120 * animationAmount, height: 120 * animationAmount)
                                .rotationEffect(.degrees(Double(colorIndex) * 10))
                                .overlay(
                                    
                                    Circle()
                                        .stroke(lineWidth: 10)
                                        .foregroundColor(.clear)
                                        .background(
                                            
                                            ZStack{
                                                Circle()
                                                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                                    .foregroundColor(colors[(colorIndex + 10) % colors.count])
                                                    .blur(radius: 5)
                                                //bluring circle edge
                                                Circle()
                                                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                                    .foregroundColor(colors[(colorIndex + 2) % colors.count])
                                                    .blur(radius: 5)
                                                Circle()
                                                    .foregroundColor(.white)
                                                    .frame(width: 10)
                                                    .blur(radius: 5)
                                                
                                            }
                                            
                                            
                                        )
                                    
                                    
                                )
                                .opacity(isAnimating  ? 1.0 : 0.0) // Initial opacity is 0
                            Circle()
                                .foregroundColor(colors[(colorIndex + 14) % colors.count]) // Use (colorIndex + 2) instead of colorIndex
                                .frame(width: 80 * animationAmount, height: 80 * animationAmount)
                                .rotationEffect(.degrees(Double(colorIndex) * 10))
                                .overlay(
                                    
                                    Circle()
                                        .stroke(lineWidth: 10)
                                        .foregroundColor(.clear)
                                        .background(
                                            
                                            ZStack{
                                                Circle()
                                                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                                    .foregroundColor(colors[(colorIndex + 14) % colors.count])
                                                    .blur(radius: 5)
                                                //bluring circle edge
                                                Circle()
                                                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                                    .foregroundColor(colors[(colorIndex + 12) % colors.count])
                                                    .blur(radius: 5)
                                                Circle()
                                                    .foregroundColor(.white)
                                                    .frame(width: 10)
                                                    .blur(radius: 5)
                                                
                                            }
                                            
                                            
                                        )
                                    
                                    
                                )
                                .opacity(isAnimating  ? 1.0 : 0.0) // Initial opacity is 0
                            Circle()
                                .foregroundColor(colors[(colorIndex + 1) % colors.count]) // Use (colorIndex + 2) instead of colorIndex
                                .frame(width: 50 * animationAmount, height: 50 * animationAmount)
                                .rotationEffect(.degrees(Double(colorIndex) * 10))
                                .overlay(
                                    
                                    Circle()
                                        .stroke(lineWidth: 10)
                                        .foregroundColor(.clear)
                                        .background(
                                            
                                            ZStack{
                                                Circle()
                                                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                                    .foregroundColor(colors[(colorIndex + 9) % colors.count])
                                                    .blur(radius: 5)
                                                //bluring circle edge
                                                Circle()
                                                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                                    .foregroundColor(colors[(colorIndex + 5) % colors.count])
                                                    .blur(radius: 5)
                                                Circle()
                                                    .foregroundColor(.white)
                                                    .frame(width: 10)
                                                    .blur(radius: 5)
                                                
                                            }
                                            
                                            
                                        )
                                    
                                    
                                )
                                .opacity(isAnimating  ? 1.0 : 0.0) // Initial opacity is 0
                            
                            //............................................................................
                            //white circle
                            Circle()
                                .fill(isYellow ? Color.clear : Color.white
                                )
                                .frame(width: isAnimating ? 250 : 200, height: isAnimating ? 250 : 200) // Increase size if isAnimating is true
                                .scaleEffect(isAnimating ? 12 : 1) // Increase scale if isAnimating is true
                            
                            Circle()
                                .trim(from: 0, to: 1)
                                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round))
                                .fill(isYellow ? AngularGradient(
                                    gradient: Gradient(colors: [.clear, .clear]),
                                    center: .center,
                                    startAngle: .zero,
                                    endAngle: .degrees(360)
                                ) : AngularGradient(
                                    gradient: Gradient(colors: isAnimating ? [.pink, .white, .green, .white, .pink] : [.pink, .white, .green, .white, .pink]),
                                    center: .center,
                                    startAngle: .zero,
                                    endAngle: .degrees(360)
                                ))
                                .blur(radius: 8)
                                .frame(width: isAnimating ? 250 : 200, height: isAnimating ? 250 : 200) // Increase size if isAnimating is true
                                .rotationEffect(Angle(degrees: 90))
                                .scaleEffect(isAnimating ? 1.5 : 1) // Increase scale if isAnimating is true
                            
                            //middle button start
                            // Hide the UI elements when the session starts
                            if isUIVisible {
                                Button(action: {
                                    toggleSession()
                                    withAnimation(Animation.easeInOut(duration: 2.0)) {
                                        yOffset = UIScreen.main.bounds.height / 2 - 100 - 150
                                        isAnimating = true
                                    }
                                    
                                    withAnimation(Animation.easeInOut(duration: 3.0).delay(1 - 2)) {
                                        isYellow = true
                                    }
                                    
                                    // Hide the UI elements
                                    isUIVisible = false
                                    
                                    // Set the start button click flag to true
                                    hasStartButtonClicked = true
                                }) {
                                    ZStack {
                                        Circle()
                                            .frame(width: 200,height: 200)
                                            .foregroundColor(.clear)
                                        
                                        Text("Start")
                                            .font(.largeTitle)
                                            .foregroundColor(.black)
                                            .bold()
                                        
                                        
                                    }
                                }
                                
                            }
                        }
                        
                        .offset(y: isAnimating ? -yOffset : 0)
                    }
                    
                }
                
                
                
                .alert(isPresented: $showSessionFinishMessage) {
                    Alert(
                        title: Text("Session Finished"),
                        message: Text("Your relaxation session has finished. Ready for another round?"),
                        
                        primaryButton: .default(Text("Cancel")) {
                            // Handle going back to home
                            dismiss()
                            // Add code to navigate back to the home view
                        },
                        secondaryButton: .default(Text("OK")) {
                            // Handle OK button action
                            sessionState = .initial
                            resetSession()
                        }
                        
                        
                        
                    )
                    
                }
            }
            // sessionState = .initial
            // resetSession()
            // Conditional view that appears on tap
            if isViewVisible {
                FullScreenOverlayView {
                    
                    VStack{
                        HStack(alignment: .center) {
                            
                            // Display remaining time as a countdown timer with circular progress
                            ZStack {
                                Circle()
                                    .stroke(style: StrokeStyle(lineWidth: 25, lineCap: .round, lineJoin: .round))
                                    .foregroundColor(Color.white)
                                    .frame(width: 350, height: 350)
                                    .opacity(0.5)
                                Circle()
                                    .trim(from: 0, to: CGFloat(elapsedTime / (sessionDuration * 60)))
                                    .stroke(style: StrokeStyle(lineWidth: 25, lineCap: .round, lineJoin: .round))
                                    .foregroundColor(Color.blue)
                                    .frame(width: 350, height: 350)
                                    .rotationEffect(.degrees(-90))
                                
                                Text(timeRemaining)
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .bold()
                                
                                    .padding()
                            }
                            .padding()
                            
                            
                            
                        }
                        .padding(.bottom,80)
                        .padding(.top,80)
                        //start and stop view
                        HStack {
                            //start and stop buttons
                            Button(action: {
                                toggleSession()
                            }) {
                                Text(sessionState == .running ? "Stop" : "Start")
                                    .padding()
                                    .background(sessionState == .running ? Color.red : Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .padding(.trailing,30)
                            }
                            
                            // Clear button
                            Button(action: {
                                resetSession()
                                shouldResetAnimation.toggle() // Toggle the state to trigger the animation reset
                                isMiddleButtonVisible = true // Show the middle button again
                            }) {
                                Text("Clear")
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                
                                
                            }
                            .onChange(of: shouldResetAnimation) { _ in
                                resetAnimation()
                                
                                
                            }
                            
                            // exit button w
                            Button(action: {
                                dismiss()
                            }) {
                                Text(" Exit ")
                                    .padding()
                                    .background(.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .padding(.leading,30)
                                
                            }
                            
                        }
                        
                    }
                    
                }
                .background(Color.black.opacity(0.2).blur(radius: 100))
                
            }
        }
        
        .onTapGesture {
            if hasStartButtonClicked {
                withAnimation {
                    isViewVisible.toggle()
                }
            }
            
            
        }
    }
    
    var timeRemaining: String {
        let remainingSeconds = max(0, Int(sessionDuration * 60 - elapsedTime))
        let minutes = remainingSeconds / 60
        let seconds = remainingSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func changeColor() {
        withAnimation(
            Animation
                .linear(duration: 2)
                .repeatForever(autoreverses: true)
        ) {
            self.colorIndex = (self.colorIndex + 1) % self.colors.count
            
        }
        
        withAnimation(
            Animation
                .linear(duration: 4)
                .repeatForever(autoreverses: true)
        ) {
            self.animationAmount = 1.2
            
        }
        print("Changing color from \(colorIndex) to \(colorIndex + 1)")
    }
    
    func changeSpeed() {
   //  timeRemaining = (timeRemaining - 1)
        
    }
    
    func startSession() {
        if sessionState == .initial {
            colorIndex = 0
            animationAmount = 1.0
            elapsedTime = 0.0
            
        }
        
        sessionState = .running
        isSessionRunning = true
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            elapsedTime += 1
            
            if elapsedTime >= sessionDuration * 60 {
                showSessionFinishMessage = true
                stopSession()
            }
            
            if isSessionRunning {
                withAnimation {
                    changeColor()
                }
            }
        }
    }
    
    func stopSession() {
        sessionState = .finished
        isSessionRunning = false
        timer?.invalidate()
        timer = nil
        
        withAnimation {
            animationAmount = 1.0
        }
    }
    
    func resetSession() {
        withAnimation(Animation.easeInOut(duration: 2.0)) {
            sessionState = .initial
            showSessionFinishMessage = false
            colorIndex = 0
            timer?.invalidate()
            timer = nil
            elapsedTime = 0.0
            
            // Stop the animation explicitly
            animationAmount = 1.0
            isAnimating = false  // Set isAnimating to false
            yOffset = 0          // Reset yOffset to its initial value
            isUIVisible = true    // Show UI elements again
            isViewVisible = false // Hide the additional view
            
            // Reset white circle related properties
            isYellow = false
            shouldResetAnimation.toggle() // Toggle the state to trigger the animation reset
            isMiddleButtonVisible = true // Show the middle button again
            
            // Reset the flag to require start button click for overlay view
            hasStartButtonClicked = false
        }
    }
    
    func toggleSession() {
        if sessionState == .initial || sessionState == .finished {
            startSession()
        } else if sessionState == .running {
            stopSession()
        }
    }
    
    func resetAnimation() {
        withAnimation(Animation.easeInOut(duration: 2.0)) {
            isYellow = false
        }
    }
    
}

struct FullScreenOverlayView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
            content
        }
    }
}

struct RainbowCircleView_Previews: PreviewProvider {
    static var previews: some View {
        RainbowCircleView()
    }
}
