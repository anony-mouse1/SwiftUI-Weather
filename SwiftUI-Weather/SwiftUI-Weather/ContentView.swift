//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Fatimah Hussain on 2/16/21.
//
//turn on canvas by clicking canvas on the top right

//refactoring--> optimizing and organizing code
import SwiftUI
//SwiftUI gets created and destroyed--Swift Ui is all about cheap views that get created and destroyed

struct ContentView: View {
    @State private var isNight = false //you tell a piece of data, i.e. source of truth, when a change happens, your ui will change. we need the ui to handle both cases (i.e. when it's false and when it's true)
    
    //ZStack is a vertical hierachy
    var body: some View {
        ZStack  {
            BackgroundView(isNight: $isNight)//this makes it binding--binding is simply making sure this isNight variable is the same as the isNight variable up top)
            //isNight ? = if isNight is True
            VStack {
                CityTextView(cityname: "Cupertino, CA") //very versatile
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: 76)
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 74)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 88)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind.snow",
                                   temperature: 55)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "sunset.fill",
                                   temperature: 60)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "snow",
                                   temperature: 25)

                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                Spacer() // dont overuse spacer, as you only get 10 views per ZStack, and Spacer counts as a view
            }

            
        }
    }
}

struct ContentView_previews: PreviewProvider{
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName) //sf symbols is used with systemName
                .renderingMode(.original) //adds color
                .resizable()
                .aspectRatio(contentMode: .fit) //fits the image into the frame
                .frame(width: 40, height: 40)
            Text("\(temperature)º") //string interpolation
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
            
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool

    //put variables outside of var body
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [isNight ? .black: .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityname: String
    
    var body: some View {
    Text("Cupertino, CA")
        .font(.system(size: 32, weight: .medium, design: .default))
        .foregroundColor(.white)
        .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName) //sf symbols is used with systemName
                .renderingMode(.original) //adds color
                .resizable()
                .aspectRatio(contentMode: .fit) //fits the image into the frame
                .frame(width: 180, height: 180)
    
            Text("\(temperature)º")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white) //makes the color white
            }
.padding(.bottom, 40)
        }
}
