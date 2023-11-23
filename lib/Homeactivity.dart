import 'package:flutter/material.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  @override
  _BottomNavigationBarDemoState createState() => _BottomNavigationBarDemoState();
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  int _currentIndex = 0;
  PageController _pageController = PageController(initialPage: 0);
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      key: _scaffoldKey, // Add the key to the Scaffold
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.blueGrey,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Open the drawer
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NotificationScreen()),
                );
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Vivek pal"),
              accountEmail: Text("vivekpal2407@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.blueGrey,
                  size: 40.0,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
            ),
            ListTile(
              title: Text('Log In'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   // MaterialPageRoute(builder: (context) => LoginScreen()),
                // );
              },
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Feedback'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),


      body: PageView(
        controller: _pageController,
        children: [
          RefineScreen(),
          ExploreScreen(),
          Text('Chat Screen'),
          Text('Contact Screen'),
        ],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.filter, size: 36),
            label: 'Refine',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_red_eye, size: 36),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat, size: 36),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts, size: 36),
            label: 'Contact',
          ),
        ],
        unselectedLabelStyle: TextStyle(color: Colors.blueGrey),
        selectedLabelStyle: TextStyle(color: Colors.blueGrey),
        unselectedItemColor: Colors.blueGrey,
        selectedItemColor: Colors.blueGrey,
      ),

    );

  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index);
  }
}
class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          // Tab Bar
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'INDIVIDUAL'),
              Tab(text: 'MERCHANT'),
              Tab(text: 'BUSINESS'),
            ],
            labelColor: Colors.blueGrey, // Set the tab's label color
            unselectedLabelColor: Colors.blueGrey,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Tab1Content(),
                Tab2Content(),
                Tab3Content(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomItemTile extends StatelessWidget {
  final String name;
  final String location;
  final String hobbies;
  final String topicsOfInterest;
  final String imageUrl;
  final int index; // Index of the tile

  CustomItemTile({
    required this.name,
    required this.location,
    required this.hobbies,
    required this.topicsOfInterest,
    required this.imageUrl,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding;
    if (index % 2 == 0) {
      // Even-numbered tiles start from 30 pixels
      padding = const EdgeInsets.fromLTRB(10, 0, 30, 0);
    } else {
      // Odd-numbered tiles start from 10 pixels
      padding = const EdgeInsets.fromLTRB(30, 0, 10, 0);
    }


    return Padding(
      padding: padding,
      child: Card(
        elevation: 5, // Add elevation to make it look like a card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // Adjust the borderRadius for more rounding
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(18),
          leading: Container(
            width: 80, // Customize the image width
            height: 400, // Customize the image height
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0), // Adjust the borderRadius for the image
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imageUrl),
              ),
            ),
          ),

          title:  Expanded(child:Row(
            children: [

              Text(name),

              TextButton(
                onPressed: () {
                  // Handle the invite button click
                },
                child: Text(
                  '+ INVITE',
                  style: TextStyle(
                    fontSize: 18, // Customize the text size
                    color: Colors.blueGrey, // Customize the text color
                  ),
                ),
              ),
            ],
          ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Location: $location'),
              Text('Hobbies: $hobbies'),
              Text('Topics of Interest: $topicsOfInterest'),
            ],
          ),
        ),
      ),
    );
  }
}

class Tab1Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CustomItemTile(
          name: 'John Doe',
          location: 'New York, USA',
          hobbies: 'Reading, Hiking',
          topicsOfInterest: 'Technology, Travel',
          imageUrl: 'images/1.jpg',
          index: 0, // Index of the tile
        ),
        CustomItemTile(
          name: 'Jane Smith',
          location: 'Los Angeles, USA',
          hobbies: 'Painting, Music',
          topicsOfInterest: 'Art, Music',
          imageUrl: 'images/1.jpg',
          index: 1, // Index of the tile
        ),
        // Add more custom item tiles as needed
      ],
    );
  }
}

class Tab2Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CustomItemTile(
          name: 'Alice Johnson',
          location: 'London, UK',
          hobbies: 'Gardening, Cooking',
          topicsOfInterest: 'Food, Gardening',
          imageUrl: 'images/1.jpg',
          index: 2, // Index of the tile
        ),
        CustomItemTile(
          name: 'Bob Wilson',
          location: 'Sydney, Australia',
          hobbies: 'Surfing, Photography',
          topicsOfInterest: 'Travel, Photography',
          imageUrl: 'images/1.jpg',
          index: 3, // Index of the tile
        ),
        // Add more custom item tiles as needed
      ],
    );
  }
}

class Tab3Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CustomItemTile(
          name: 'Eva Brown',
          location: 'Berlin, Germany',
          hobbies: 'Yoga, Reading',
          topicsOfInterest: 'Wellness, Literature',
          imageUrl: 'images/1.jpg',
          index: 4, // Index of the tile
        ),
        CustomItemTile(
          name: 'Chris Anderson',
          location: 'San Francisco, USA',
          hobbies: 'Gaming, Coding',
          topicsOfInterest: 'Technology, Gaming',
          imageUrl: 'images/1.jpg',
          index: 5, // Index of the tile
        ),
        // Add more custom item tiles as needed
      ],
    );
  }
}
class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.blueGrey, // Set the AppBar color to blue-grey
      ),
      body: Center(
        child: Text('Notification Screen Content'),
      ),
    );
  }
}


class RefineScreen extends StatefulWidget {
  @override
  _RefineScreenState createState() => _RefineScreenState();
}

class _RefineScreenState extends State<RefineScreen> {
  double _distance = 50; // Initial distance value

  List<String> purposes = [
    'Coffee',
    'Business',
    'Hobbies',
    'Friendship',
    'Movies',
    'Dining',
    'Dating',
    'Matrimony',
  ];


  List<bool> selectedPurposes = List.filled(8, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Your Availability',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blueGrey,
              ),
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: '',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Add your status...',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blueGrey,
              ),
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Add your status...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Select Hyper-Local Distance',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blueGrey,
              ),
            ),
            Slider(
              value: _distance,
              onChanged: (newValue) {
                setState(() {
                  _distance = newValue;
                });
              },
              min: 0,
              max: 100,
              divisions: 100, // To divide the slider into steps
              label: '$_distance km', // Display selected distance as a label
              activeColor: Colors.blueGrey, // Set active track color
              inactiveColor: Colors.blueGrey, // Set inactive track color
            ),
            SizedBox(height: 16),
            Text(
              'Select Purpose:',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blueGrey,
              ),
            ),
            Wrap(
              spacing: 8.0, // Adjust the spacing between buttons
              children: List<Widget>.generate(purposes.length, (int index) {
                return ElevatedButton(
                  onPressed: () {
                    // Toggle the selected state of the button
                    setState(() {
                      selectedPurposes[index] = !selectedPurposes[index];
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: selectedPurposes[index] ? Colors.grey : Colors.blueGrey,
                  ),
                  child: Text(purposes[index]),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

