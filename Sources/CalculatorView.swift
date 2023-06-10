import SwiftTUI

struct CalculatorView: View {
    @State var result: Int64 = 0

    var body: some View {
        Text("Swift Calculator by Adamekka").border()
        Spacer()

        HStack {
            Spacer()
            Text("\(result)")
            Spacer()
        }.border()

        VStack {
            HStack {
                Button("C") {}.padding().border(.red)
                Spacer()
                Button("⌫") {}.padding().border(.red)
                Spacer()
                Button("%") {}.padding().border(.red)
                Spacer()
                Button("÷") {}.padding().border(.red)
            }
            HStack {
                Button("7") {}.padding().border()
                Spacer()
                Button("8") {}.padding().border()
                Spacer()
                Button("9") {}.padding().border()
                Spacer()
                Button("×") {}.padding().border(.red)
            }
            HStack {
                Button("4") {}.padding().border()
                Spacer()
                Button("5") {}.padding().border()
                Spacer()
                Button("6") {}.padding().border()
                Spacer()
                Button("−") {}.padding().border(.red)
            }
            HStack {
                Button("1") {}.padding().border()
                Spacer()
                Button("2") {}.padding().border()
                Spacer()
                Button("3") {}.padding().border()
                Spacer()
                Button("+") {}.padding().border(.red)
            }
            HStack {
                Button("?") {}.padding().border(.blue)
                Spacer()
                Button("0") {}.padding().border()
                Spacer()
                Button(".") {}.padding().border()
                Spacer()
                Button("=") {}.padding().background(.red).border(.red)
            }
        }.border()
    }
}
