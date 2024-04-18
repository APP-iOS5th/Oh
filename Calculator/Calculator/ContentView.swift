
import SwiftUI


struct CalculationHistory {
    let calculation: String
    let result: String
}

enum CalcButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case divide = "÷"
    case mutliply = "x"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "-/+"

    var buttonColor: Color {
        switch self {
        case .add, .subtract, .mutliply, .divide, .equal:
            return .orange
        case .clear, .negative, .percent:
            return Color(.lightGray)
        default:
            return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
        }
    }
}

enum Operation {
    case add, subtract, multiply, divide, none
}

struct ContentView: View {

    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation: Operation = .none
    @State private var history: [CalculationHistory] = []
    
    let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .mutliply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal],
    ]

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()

                // Text display
                HStack {
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                }
                .padding()
                
                
                ScrollView(showsIndicators: false) {
                    HStack {
                        Spacer()
                        VStack(alignment: .leading, spacing: 5) {
                            ForEach(history, id: \.calculation) { item in
                                VStack(alignment: .leading) {
                                    Text(item.calculation)
                                        .font(.callout)
                                        .foregroundColor(Color.gray)
                                    Text("= \(item.result)")
                                        .font(.callout)
                                        .foregroundColor(Color.gray)
                                }
                            }
                        }.padding()
                    }
                }

                // Our buttons
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                self.didTap(button: item)
                            }, label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(
                                        width: self.buttonWidth(item: item),
                                        height: self.buttonHeight()
                                    )
                                    .background(item.buttonColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(self.buttonWidth(item: item)/2)
                            })
                        }
                    }
                    .padding(.bottom, 3)
                }
            }
        }
    }

    func didTap(button: CalcButton) {
        switch button {
        case .add, .subtract, .mutliply, .divide, .equal:
            if button == .equal {
                let runningValue = self.runningNumber
                let currentValue = Int(self.value) ?? 0
                let calculation: String
                
                switch self.currentOperation {
                case .add:
                    self.value = "\(runningValue + currentValue)"
                    calculation = "\(runningValue) + \(currentValue)"
                case .subtract:
                    self.value = "\(runningValue - currentValue)"
                    calculation = "\(runningValue) - \(currentValue)"
                case .multiply:
                    self.value = "\(runningValue * currentValue)"
                    calculation = "\(runningValue) x \(currentValue)"
                case .divide:
                    self.value = "\(runningValue / currentValue)"
                    calculation = "\(runningValue) ÷ \(currentValue)"
                case .none:
                    return
                }
                
                // 계산 결과를 히스토리에 추가
                let result = self.value
                self.history.append(CalculationHistory(calculation: calculation, result: result))
            }
            
            // 연산자 버튼을 눌렀을 때 로직
            if button != .equal {
                self.currentOperation = button == .add ? .add
                    : button == .subtract ? .subtract
                    : button == .mutliply ? .multiply
                    : .divide
                self.runningNumber = Int(self.value) ?? 0
                self.value = "0"
            }
        case .clear:
            self.value = "0"
            self.history = [] // "AC" 버튼을 누르면 히스토리도 초기화
        case .decimal, .negative, .percent:
            break
        default:
            // 숫자 버튼 눌렀을 때 로직
            let number = button.rawValue
            if self.value == "0" {
                value = number
            } else {
                self.value = "\(self.value)\(number)"
            }
        }
    }

    func buttonWidth(item: CalcButton) -> CGFloat {
        if item == .zero {
            return ((UIScreen.main.bounds.width - (4*12)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }

    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
