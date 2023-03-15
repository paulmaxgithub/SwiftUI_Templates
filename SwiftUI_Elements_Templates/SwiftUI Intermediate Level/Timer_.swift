//
//  Timer_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 11.03.23.
//

import SwiftUI

struct Timer_: View {
    
    // CURRENT TIMER
    @State private var currnetDate: Date = Date()
    
    let timer = Timer
        .publish(every: 1.0, on: .main, in: .common)
        .autoconnect()
    
    let animationTimer = Timer
        .publish(every: 0.3, on: .main, in: .common)
        .autoconnect()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.timeZone = .init(identifier: "DE")
        return formatter
    }
    
    // COUNTDOWN
    @State private var count: Int = 10
    @State private var finishedText: String? = nil
    
    // COUNTDOWN TO DATE
    @State private var timeRemaining: String = ""
    let futureDate = Calendar.current.date(byAdding: .day, value: 1, to: Date())
    
    // ANIMATION COUNTER
    @State private var counter: Int = 0
    
    // PAGE ANIMATION COUNTER
    @State private var pageCounter: Int = 1
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.orange, .blue]),
                           center: .center,
                           startRadius: 5,
                           endRadius: 500)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                TextForTimerView(currentText: dateFormatter.string(from: currnetDate))
                Divider()
                TextForTimerView(currentText: finishedText ?? "\(count)")
                Divider()
                TextForTimerView(currentText: timeRemaining)
                Divider()
                ExtractedHStack(counter: counter)
                Spacer()
                TabViewExtractedView(count: $pageCounter)
            }
            .padding(.horizontal)
        }
        .onReceive(timer) { output in
            // CURRENT TIMER
            currnetDate = output

            // COUNTDOWN
            if count <= 1 { finishedText = "Finished!" }
            else { count -= 1 }
            
            // COUNTDOWN TO DATE
            updateTimeRemaining()
        }
        // ANIMATION COUNTER
        .onReceive(animationTimer) { _ in
            withAnimation(.easeInOut(duration: 0.3)) {
                counter = counter == 3 ? 0 : counter + 1
            }
        }
        // PAGE ANIMATION COUNTER
        .onReceive(timer) { _ in
            withAnimation(.linear) {
                pageCounter = pageCounter == 4 ? 1 : pageCounter + 1
            }
        }
    }
    
    private func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents(
            [.hour, .minute, .second], from: Date(), to: futureDate ?? Date())
        let hour    = remaining.hour ?? 0
        let minute  = remaining.minute ?? 0
        let second  = remaining.second ?? 0
        timeRemaining = "\(hour):\(minute):\(second)"
    }
}

struct TextForTimerView: View {
    
    var currentText: String
    
    var body: some View {
        Text(currentText)
            .font(.system(size: 100, weight: .semibold, design: .rounded))
            .foregroundColor(.white)
            .lineLimit(1)
            .minimumScaleFactor(0.1)
            .padding()
    }
}

struct ExtractedHStack: View {
    
    var counter: Int
    
    var body: some View {
        HStack(spacing: 5) {
            Circle()
                .offset(y: counter == 1 ? -20 : 0)
            Circle()
                .offset(y: counter == 2 ? -20 : 0)
            Circle()
                .offset(y: counter == 3 ? -20 : 0)
        }
        .foregroundColor(.white)
        .frame(width: 200)
    }
}

struct TabViewExtractedView: View {
    
    @Binding var count: Int
    
    var body: some View {
        TabView(selection: $count) {
            Rectangle()
                .foregroundColor(.red)
                .tag(1)
            Rectangle()
                .foregroundColor(.green)
                .tag(2)
            Rectangle()
                .foregroundColor(.yellow)
                .tag(3)
            Rectangle()
                .foregroundColor(.purple)
                .tag(4)
        }
        .frame(height: 150)
        .padding(.bottom, 40)
        .tabViewStyle(.page)
    }
}
