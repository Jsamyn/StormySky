//
//  ContentView.swift
//  Bolt.iOS
//
//  Created by Joseph Samyn on 10/22/22.
//

import SwiftUI

struct ForecastHome: View {
    
    @State private var isMetric: Bool = false
    @ObservedObject var vm: ForecastHomeViewModel
    
    init(dailyForecastService: DailyForecastServiceProtocol) {
        self.vm = ForecastHomeViewModel(dailyForecastService: dailyForecastService)
    }
    
    var body: some View {
        VStack {
            
            /* Activity Indicator */
            Group {
                /* Refresh Button */
                if (vm.state.isLoading){
                    ProgressView()
                        .tint(Color("PrimaryDark"))
                        .padding(5)
                } else {
                    Button(action: reload){
                        Image(systemName: "arrow.clockwise")
                            .foregroundColor(Color("PrimaryDark"))
                            .padding(6)
                    }
                }
            }.frame(width: 25, height: 25)
            
            /* City Information */
            CText("\(vm.state.forecast.city), \(vm.state.forecast.state)")
                .font(.system(size: 36))
                .padding(.bottom, 5)
            Text(vm.state.forecast.date, format: Date.FormatStyle().year().month().day().hour().minute())
                .font(.subheadline)
                .foregroundColor(!isMetric ? Color("PrimaryDark") : Color("PrimaryLight"))
            
            
            /* Current Weather Icon */
            Image(systemName: vm.state.forecast.icon)
                .font(.system(size: 150))
                .foregroundColor(Color("PrimaryDark"))
                .padding(15)
            
            /* Current Weather Text Data */
            CText("\(vm.state.forecast.temperature)")
                .font(.system(size: 68))
                .padding(5)
            
            CText(vm.state.forecast.weatherDescription)
                .font(.title2)
            CText("Feels Like \(vm.state.forecast.realFeel)")
                .font(.subheadline)
                .padding(.bottom)
            
            Divider()
                .frame(width: 50, height: 0.5)
                .background(Color("PrimaryDark"))
                .padding()
            
            
            /* Weather Wigits */
            HStack {
                WeatherDataWidget(icon: "sunrise", name: "Sunrise", value: "6:10")
                    .padding(.horizontal, 25)
                WeatherDataWidget(icon: "sunrise", name: "Sunrise", value: "6:10")
                    .padding(.horizontal, 25)
                WeatherDataWidget(icon: "sunrise", name: "Sunrise", value: "6:10")
                    .padding(.horizontal, 25)
            }
            .padding(.bottom, 30)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Primary"))
        .onAppear {
            Task {
                await vm.trigger(ForecastHomeInput.load)
            }
        }
    }
    
    /**
     Reload daily forecast data and refresh page UI
     */
    func reload() {
        Task {
            await vm.trigger(ForecastHomeInput.load)
        }
    }
}

#if !TESTING
struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ForecastHome(dailyForecastService: DailyForecastService())
    }
}
#endif
