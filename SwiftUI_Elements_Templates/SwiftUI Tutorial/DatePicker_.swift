//
//  DatePicker_.swift
//  UIElementsProject
//
//  Created by PaulmaX on 31.01.23.
//

import SwiftUI

struct DatePicker_: View {
    
    @State private var selectedDate: Date = Date()
    
    let startDate: Date = Calendar.current.date(from: DateComponents(year: 2018)) ?? Date()
    
    let endingDate: Date = Date()
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        formatter.timeZone = .autoupdatingCurrent
        return formatter
    }
    
    var body: some View {
        VStack {
            
            Text("\(dateFormatter.string(from: selectedDate))")
                .font(.title3)
            
            DatePicker("Select a Time", selection: $selectedDate, displayedComponents: .hourAndMinute)
                .foregroundColor(.red)
                .font(.headline)
                .accentColor(.secondary)
                .datePickerStyle(.graphical)
                .accessibility(label: Text("Calendar"))
                .padding(30)
                .background(.orange)
                .cornerRadius(10)
                .padding()
            
            //                        .datePickerStyle(.wheel)
            //                        .datePickerStyle(.compact)
            //                        .datePickerStyle(.automatic)
            
            //            DatePicker("Select a Date", selection: $selectedDate, displayedComponents: .date)
            DatePicker("Select a Date", selection: $selectedDate, in: startDate...endingDate)
                .foregroundColor(.red)
                .font(.headline)
                .accentColor(.secondary)
                .datePickerStyle(.graphical)
                .accessibility(label: Text("Calendar"))
                .padding(30)
                .background(.orange)
                .cornerRadius(10)
                .padding()
            
        }
    }
}

struct DatePicker__Previews: PreviewProvider {
    static var previews: some View {
        DatePicker_()
    }
}
