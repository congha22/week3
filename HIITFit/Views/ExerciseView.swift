import SwiftUI
import AVKit
struct ExerciseView: View {
    @State var start = false
    
    let videoNames = ["squat", "step-up", "burpee", "sun-salute"]
    let exerciseNames = ["Squat", "Step Up", "Burpee", "Sun Salute"]
    let index: Int
    let interval: TimeInterval = 30
    var body: some View {
        GeometryReader {
            geometry in
                VStack {
                    HeaderView(titleText: exerciseNames[index])
                        .padding(.bottom)
                    if let url = Bundle.main.url(
                        forResource: videoNames[index],
                        withExtension: "mp4") {
                        VideoPlayer(player: AVPlayer(url: url))
                            .frame(height: geometry.size.height * 0.45)
                    } else {
                        Text("Couldn't find \(videoNames[index]).mp4")
                            .foregroundColor(.red)
                    }
                    Text(Date().addingTimeInterval(interval), style: .timer).font(.system(size: 90))
                    Button("Start/Done") {
                        self.start = true
                    }.sheet(isPresented: $start, content:
                                {if #available(iOS 15.0, *) {
                                    SuccessView()
                                } else {
                                    // Fallback on earlier versions
                                }})
                    RatingView()
                        .padding()
                    Spacer()
                    Button("History") {}
                        .padding(.bottom)
                }
        }
    }
}
struct ExerciseView_Previews: PreviewProvider {
    static
    var previews: some View {
        ExerciseView(index: 0)
    }
}
