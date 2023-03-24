import SwiftUI

@available(iOS 14.0, *)
public struct TwoView: View {
    public init(whenComplete: @escaping () -> ()) {
        self.whenComplete = whenComplete
    }
    
    var whenComplete: () -> ()
    @State var is_two_chuyen_man = false
    @State var is_two_load_hide = false
    @State var is_two_ktra_mat_khau: String = ""
    @State var is_two_vui_long_cho = true
    
    public var body: some View {
        ZStack {
            if is_two_chuyen_man {
                EmptyView().onAppear {
                    self.whenComplete()
                }
            } else {
                if is_two_load_hide {
                    ProgressView("")
                }
                
                if is_two_vui_long_cho {
                    ProgressView("")
                }
                
                ZStack {
                    CoordsTwo(url: URL(string: ""), is_two_chuyen_man: $is_two_chuyen_man, is_two_load_hide: $is_two_load_hide, is_two_ktra_matkhau: $is_two_ktra_mat_khau)
                        .opacity(is_two_load_hide ? 0 : 1)
                        .opacity(is_two_vui_long_cho ? 0 : 1)
                }.zIndex(2)
            }
        }.foregroundColor(Color.black)
            .background(Color.white)
            .onAppear {
                twoHamTimeRun()
            
            }
            
            
        }
    
    func twoHamTimeRun() {
        is_two_vui_long_cho = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            is_two_vui_long_cho = false
        }
    }
}
