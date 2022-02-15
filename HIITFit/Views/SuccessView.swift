import SwiftUI

@available(iOS 15.0, *)
struct SuccessView: View {
    @Environment(\.dismiss) var dismiss
    
    let message = """
    Good job completing all four exercies!
    Remember tomorrow's another day.
    So eat well and get some rest.
    """
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Image(systemName: "hand.raised.fill").resizedToFill(width: 75, height: 75).foregroundColor(.purple)
                Text("High Five!").font(.largeTitle).fontWeight(.heavy).padding()
                Text(message).foregroundColor(.gray).multilineTextAlignment(.center)
                Spacer()
                Button("Done") {
                    dismiss()
                }
            }
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            SuccessView()
        } else {
            // Fallback on earlier versions
        }
    }
}
