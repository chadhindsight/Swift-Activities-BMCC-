import SwiftUI

struct ContentView: View {
    //MARK: - Struct
    struct MoodLog: Identifiable {
        let id = UUID() // Unique ID
        
        var logName: String
        var logGoodDay: Bool
        var logNotes: String
        var date: Date // Timestamp
        
        func printMood() -> String {
            logGoodDay
            ? "\(logName) had a good day because of \(logNotes)"
            : "\(logName) had a bad day because of \(logNotes)"
        }
    }//end of MoodLog
    
    //MARK: - State Variables
    @State var inputName: String = ""
    @State var hadAGoodDay: Bool = false
    @State var inputNotes: String = ""
    @State var myLogs: [MoodLog] = []
    
    //MARK: - Computed Properties
    var goodDayCount: Int {
        myLogs.filter { $0.logGoodDay }.count
    }
    
    //MARK: - Body
    var body: some View {
        VStack {
            
            Text("Welcome to Mood Tracker")
                .font(.title2)
                .bold()
                .padding()
            
            TextField("Enter a name", text: $inputName)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Toggle("Was today a good day", isOn: $hadAGoodDay)
                .padding()
            
            TextField("Notes", text: $inputNotes)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            HStack{
                //MARK: - Reset Button
                Button {
                    resetValues()
                } label: {
                    Text("Reset Fields")
                }
                .buttonStyle(.borderedProminent)
                .padding()
                
                //MARK: - Submit Button
                Button {
                    myLogs.append(MoodLog(
                        logName: inputName,
                        logGoodDay: hadAGoodDay,
                        logNotes: inputNotes,
                        date: Date()
                    ))
                    print(myLogs)
                    resetValues()
                } label: {
                    Text("Submit Record")
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
            
            //MARK: - Good Day Count
            Text("Good Days Logged: \(goodDayCount)")
                .font(.headline)
                .padding(.top)
            
            //MARK: - Log List with Delete
            List {
                ForEach(myLogs) { oneLog in
                    VStack(alignment: .leading) {
                        Text(oneLog.printMood())
                            .foregroundColor(oneLog.logGoodDay ? .green : .red)
                        
                        Text(oneLog.date.formatted(date: .abbreviated, time: .shortened))
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .onDelete(perform: deleteLog)
            }
            
        }//end of VStack
        .padding()
        
    }// end of Body
    
    //MARK: - Functions
    func resetValues(){
        inputName = ""
        hadAGoodDay = false
        inputNotes = ""
    }
    
    func deleteLog(at offsets: IndexSet) {
        myLogs.remove(atOffsets: offsets)
    }
    
}// end of ContentView

#Preview {
    ContentView()
}
