import SwiftUI

struct ContentView: View
{
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View
    {
        NavigationView
        {
            List(networkManager.posts){ post in
                NavigationLink(
                    destination: DetailView(url: post.url), label: {
                        HStack
                        {
                            Text(String(post.points))
                            Text(post.title)
                        }
                    })
            }
            .navigationBarTitle("HACKER NEWS")
        }
        .onAppear(perform: {
            self.networkManager.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
