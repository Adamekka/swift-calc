import SwiftTUI

enum Operation {
    case add
    case subtract
    case multiply
    case divide

    var debugDescription: String {
        switch self {
        case .add: return "+"
        case .subtract: return "−"
        case .multiply: return "×"
        case .divide: return "÷"
        }
    }
}

enum Error {
    case divisionByZero
    case overflow
    case underflow

    var debugDescription: String {
        switch self {
        case .divisionByZero: return "Division by zero"
        case .overflow: return "Overflow"
        case .underflow: return "Underflow"
        }
    }
}

enum Status: CustomDebugStringConvertible {
    case operation(Operation)
    case error(Error)
    case none

    var debugDescription: String {
        switch self {
        case .operation(let operation): return operation.debugDescription
        case .error(let error): return error.debugDescription
        case .none: return "none"
        }
    }
}

enum AppendResult {
    case success(Int64)
    case error(Error)
}

func tryAppend(result: Int64, num: String) -> AppendResult {
    if let result: Int64 = Int64(String(result) + num) {
        return .success(result)
    } else {
        return .error(.overflow)
    }
}

struct CalculatorView: View {
    @State var result: Int64 = 0
    @State var status: Status = .none

    var body: some View {
        Text("Swift Calculator by Adamekka").border()
        Spacer()

        HStack {
            Spacer()
            Text("Status: \(status)")
            Spacer()
        }.border()

        HStack {
            Spacer()
            Text("\(result)")
            Spacer()
        }.border()

        VStack {
            HStack {
                Button("C") {
                    result = 0
                }.padding().border(.red)
                Spacer()
                Button("⌫") {
                    result = Int64(String(result).dropLast()) ?? 0
                }.padding().border(.red)
                Spacer()
                Button("%") {
                    result /= 100
                }.padding().border(.red)
                Spacer()
                Button("÷") {
                    status = .operation(.divide)
                }.padding().border(.red)
            }
            HStack {
                Button("7") {
                    switch tryAppend(result: result, num: "7") {
                    case .success(let result):
                        self.result = result
                    case .error(let error):
                        status = .error(error)
                    }
                }.padding().border()
                Spacer()
                Button("8") {
                    switch tryAppend(result: result, num: "8") {
                    case .success(let result):
                        self.result = result
                    case .error(let error):
                        status = .error(error)
                    }
                }.padding().border()
                Spacer()
                Button("9") {
                    switch tryAppend(result: result, num: "9") {
                    case .success(let result):
                        self.result = result
                    case .error(let error):
                        status = .error(error)
                    }
                }.padding().border()
                Spacer()
                Button("×") {
                    status = .operation(.multiply)
                }.padding().border(.red)
            }
            HStack {
                Button("4") {
                    switch tryAppend(result: result, num: "4") {
                    case .success(let result):
                        self.result = result
                    case .error(let error):
                        status = .error(error)
                    }
                }.padding().border()
                Spacer()
                Button("5") {
                    switch tryAppend(result: result, num: "5") {
                    case .success(let result):
                        self.result = result
                    case .error(let error):
                        status = .error(error)
                    }
                }.padding().border()
                Spacer()
                Button("6") {
                    switch tryAppend(result: result, num: "6") {
                    case .success(let result):
                        self.result = result
                    case .error(let error):
                        status = .error(error)
                    }
                }.padding().border()
                Spacer()
                Button("−") {
                    status = .operation(.subtract)
                }.padding().border(.red)
            }
            HStack {
                Button("1") {
                    switch tryAppend(result: result, num: "1") {
                    case .success(let result):
                        self.result = result
                    case .error(let error):
                        status = .error(error)
                    }
                }.padding().border()
                Spacer()
                Button("2") {
                    switch tryAppend(result: result, num: "2") {
                    case .success(let result):
                        self.result = result
                    case .error(let error):
                        status = .error(error)
                    }
                }.padding().border()
                Spacer()
                Button("3") {
                    switch tryAppend(result: result, num: "3") {
                    case .success(let result):
                        self.result = result
                    case .error(let error):
                        status = .error(error)
                    }
                }.padding().border()
                Spacer()
                Button("+") {
                    status = .operation(.add)
                }.padding().border(.red)
            }
            HStack {
                Button("?") {}.padding().border(.blue)
                Spacer()
                Button("0") {
                    switch tryAppend(result: result, num: "0") {
                    case .success(let result):
                        self.result = result
                    case .error(let error):
                        status = .error(error)
                    }
                }.padding().border()
                Spacer()
                Button(".") {}.padding().border()
                Spacer()
                Button("=") {}.padding().background(.red).border(.red)
            }
        }.border()
    }
}
