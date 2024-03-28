/*
 This Swift document defines a SwiftUI view called `LocationsView`. Let's break down what it does:

 1. It imports the SwiftUI framework.

 2. `LocationsView` is a SwiftUI `View` struct.

 3. It has a property `model` of type `Model`, which is an `@EnvironmentObject`. This means that this view expects to receive a `Model` object via the environment. `@EnvironmentObject` is used for passing data down the view hierarchy implicitly.

 4. Inside the `body` computed property, the view is structured using a `VStack`, which arranges its child views vertically.

 5. It starts by displaying a `LittleLemonLogo`. This is presumably an image or logo related to the app. It's given a padding at the top to adjust its position.

 6. Then, there's a `Text` element. This text changes dynamically based on the value of `model.displayingReservationForm`. If it's `true`, it displays "Reservation Details"; otherwise, it displays "Select a location".

 7. Inside a `NavigationView`, there's a `List` that displays the restaurant locations. Each item in the list is represented by a `NavigationLink` that, when tapped, navigates to a `ReservationForm`, passing the selected restaurant as a parameter. The `List` uses the `model.restaurants` array for its data, and it's identified by `\.self`.

 8. The `navigationBarTitle` is set to an empty string to remove the default navigation title, and `navigationBarHidden` is set to `true` to hide the navigation bar.

 9. Finally, the `LocationsView` applies padding to the top of its content to adjust the layout.

 10. `ContentView_Previews` provides a preview of the `LocationsView`, initializing it with a `Model` object as an environment object. This is necessary for previewing the view since it expects an environment object of type `Model`.

 In summary, this file defines a SwiftUI view that displays a list of restaurant locations and dynamically updates a text element based on a boolean variable (`displayingReservationForm`). It utilizes navigation to allow the user to navigate to a reservation form when tapping on a restaurant location.
 */

import SwiftUI

struct LocationsView: View {
    @EnvironmentObject var model: Model

    var body: some View {
        VStack {
            LittleLemonLogo() // 1
                .padding(.top, 50)
            
            Text(model.displayingReservationForm ? "Reservation Details" : "Select a location")
                .padding([.leading, .trailing], 40)
                .padding([.top, .bottom], 8)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20)
 //Using displayingReservationForm as a controlling variable, replace the line EmptyView() // 2 with a Text element that shows the string "Reservation Details" if displayingReservationForm is true and Select a location otherwise.
            
            NavigationView {
                List(model.restaurants, id: \.self) { restaurant in
                    NavigationLink(destination: ReservationForm(restaurant)) {
                        RestaurantView(restaurant)
                    }
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }
        .padding(.top, -10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView().environmentObject(Model())
    }
}

