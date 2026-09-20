# 🚀 **NASA Space Lines**

NASA Space Lines is a space exploration application developed with Flutter and Dart.

The project allows users to explore different space destinations, view information about planets and the International Space Station (ISS), access NASA's Astronomy Picture of the Day (APOD), and calculate how much they would weigh on different celestial bodies.

The application was developed as a practical project to improve mobile and web application development skills, API integration, UI development, state management, and problem-solving with Flutter.

---

## 🌌 **Project Overview**

NASA Space Lines provides an interactive space-themed experience where users can:

- Explore different space destinations
- View information about planets and the ISS
- See each destination's gravity
- Calculate their estimated weight on another celestial body
- Access NASA's Astronomy Picture of the Day (APOD)
- Display NASA images dynamically through an API
- Handle both image and video APOD content
- Navigate between different application screens
- Run the project through Flutter Web

---

## ✨ **Features**

### 🪐 **Space Destinations**

Users can select different destinations:

- Mars
- Moon
- Neptune
- Saturn
- International Space Station (ISS)
- Sun

Each destination contains:

- Destination status
- Distance from Earth
- Environmental conditions
- Gravity
- Description
- Planet/destination image

---


### 🌠 **NASA Astronomy Picture of the Day**

The application integrates with NASA's APOD API.

The application dynamically retrieves:

APOD date
Title
Media type
Media URL

Depending on the content returned by NASA, the application handles:

Image

or

Video

For image content, the application displays the NASA image directly inside the application.

For video content, the application displays a dedicated video information card.


### 🛰️ **NASA API Integration**
---

The project uses NASA's Astronomy Picture of the Day API.

API endpoint:

https://api.nasa.gov/planetary/apod

The API key is provided at runtime using Flutter's --dart-define mechanism.

Example:

flutter run -d chrome --dart-define=NASA_API_KEY=YOUR_API_KEY
Important

Do not commit your NASA API key to GitHub.

The project intentionally reads the API key using:

const apiKey = String.fromEnvironment('NASA_API_KEY');

This keeps the key outside the source code.

Note: because this project runs on Flutter Web, values passed with --dart-define can ultimately be exposed in the client application. For a production application, a backend/proxy and appropriate API restrictions should be considered.



### 🛠️ **Technologies**
---
Technology	Purpose
Flutter	Application framework
Dart	Programming language
Flutter Web	Web application runtime
Material Design	UI components
NASA APOD API	Astronomy data and media
HTTP	API communication
JSON	API data format
VS Code	Development environment
Git	Version control
GitHub	Source code repository

### 📂 **Project Structure**
---
Nasa_Space_Trip_App/
│
├── android/
├── ios/
├── linux/
├── macos/
├── web/
├── windows/
│
├── assets/
│   └── imagens/
│       ├── background.jpg
│       ├── iss.png
│       ├── mars.png
│       ├── moon.png
│       ├── neptune.png
│       ├── saturn.png
│       └── sun.png
│
├── lib/
│   ├── screens/
│   │   ├── data/
│   │   │   └── planets.dart
│   │   │
│   │   ├── body_screen.dart
│   │   ├── home_screen.dart
│   │   └── planet_detail_screen.dart
│   │
│   ├── services/
│   │   └── nasa_service.dart
│   │
│   └── main.dart
│
├── test/
│
├── pubspec.yaml
├── pubspec.lock
├── analysis_options.yaml
└── README.md

---

### 🧭 **Traceability / Setup Table**
---

The table below provides a quick traceability guide for developers who want to run, understand, or troubleshoot the project.

Step	Component	Location	Purpose	Verification
1	Flutter SDK	Local environment	Provides the development framework	flutter --version
2	Project dependencies	pubspec.yaml	Defines project packages	flutter pub get
3	Assets	assets/imagens/	Stores application images	Check image files exist
4	Main entry point	lib/main.dart	Starts the application	Run the project
5	Home screen	lib/screens/home_screen.dart	Application landing screen	Home screen appears
6	Destination screen	lib/screens/body_screen.dart	Displays available destinations	Destination list appears
7	Planet data	lib/screens/data/planets.dart	Stores destination information	Destination cards load
8	Detail screen	lib/screens/planet_detail_screen.dart	Displays destination details	Select a destination
9	Gravity calculator	planet_detail_screen.dart	Calculates destination weight	Enter a valid weight
10	NASA service	lib/services/nasa_service.dart	Communicates with NASA API	API request returns data
11	NASA API key	Runtime environment	Authenticates API request	--dart-define
12	NASA APOD	planet_detail_screen.dart	Displays NASA daily content	Image/video appears
13	Flutter Web	Chrome	Runs the application	flutter run -d chrome
14	Code analysis	Flutter CLI	Checks code quality	flutter analyze

---

### **💻 Requirements**

Before running the project, make sure you have:

Flutter SDK
Dart SDK
Git
Visual Studio Code or another compatible IDE
Google Chrome
Internet connection
NASA API key

Check Flutter installation:

flutter --version

Check available devices:

flutter devices
---

### **🚀 Getting Started**
1. Clone the repository
git clone https://github.com/YOUR_USERNAME/Nasa_Space_Trip_App.git

Enter the project directory:

cd Nasa_Space_Trip_App
2. Install dependencies

Run:

flutter pub get
3. Verify the project

Run:

flutter analyze

The expected result is:

No issues found!
4. Configure the NASA API key

The project expects the NASA API key through --dart-define.

Run:

flutter run -d chrome --dart-define=NASA_API_KEY=YOUR_API_KEY

Replace:

YOUR_API_KEY

with your NASA API key.

▶️ Running the Application

To run the project on Chrome:

flutter run -d chrome --dart-define=NASA_API_KEY=YOUR_API_KEY

The application should open in Chrome.

🧪 Testing the Main Features

After starting the application:

Home
Open the application.
Confirm that the NASA Space Lines home screen appears.
Click ENTER.
Destinations
Select a destination.
Confirm that the destination image loads.
Verify the destination information.
NASA APOD
Open a destination.
Scroll to the NASA APOD section.
Wait for the NASA content to load.
Verify the title and image/video.
Gravity Calculator
Enter a weight in kilograms.
Click:
CALCULAR PESO ESPACIAL
Verify the calculated result.
---

### **🔐 API Security**

Never commit API keys directly into source code.

Avoid:

const apiKey = 'MY_SECRET_KEY';

Instead, this project uses:

const apiKey = String.fromEnvironment('NASA_API_KEY');

Then the key is provided when running the application:

flutter run -d chrome --dart-define=NASA_API_KEY=YOUR_API_KEY

For production environments, consider using a backend service to keep API credentials away from the client.
\---

### **🖼️ Assets**

The project uses local images for the space destinations.

Current assets include:

background.jpg
iss.png
mars.png
moon.png
neptune.png
saturn.png
sun.png

They are registered in pubspec.yaml:

flutter:
  uses-material-design: true

  assets:
    - assets/imagens/

---

### **🧠 Main Development Concepts**

This project was developed to practice several important Flutter concepts:

StatelessWidget
StatefulWidget
Widget composition
Navigation
Navigator.push
Navigator.pop
ListView.builder
FutureBuilder
HTTP requests
JSON decoding
API integration
TextEditingController
State updates with setState
Asset management
Conditional rendering
Error handling
Flutter Web
Responsive UI
Runtime environment variables

---

### **🌐 Flutter Web and NASA Images**

Because the project runs on Flutter Web, external NASA images can require special handling when displayed from another domain.

The application uses:

webHtmlElementStrategy: WebHtmlElementStrategy.prefer

when displaying NASA APOD images.

This allows the Flutter Web application to display external images in the browser environment.

---

##🧩 Troubleshooting
Problem: NASA image does not appear

Check:

Internet connection
NASA API key
API response
Browser console
Image.network() configuration

Run:

flutter analyze

Then restart the application.

Problem: Dependencies are missing

Run:

flutter pub get
Problem: Flutter Web is not available

Check:

flutter devices

Chrome should appear as an available device.

Problem: Assets are not found

Check that the files exist:

assets/imagens/

and that pubspec.yaml contains:

assets:
  - assets/imagens/

Then run:

flutter pub get
---

### **📈 Future Improvements**

Possible future improvements include:

NASA APOD video playback
More celestial bodies
Favorite destinations
Search functionality
Improved animations
NASA mission information
Space weather data
User profiles
Dark/light theme options
Improved responsive layouts
Automated tests
Backend integration
API caching
Production deployment
---

### **👩‍💻 Author**

Developed as a Flutter/Dart project focused on application development, API integration, and space exploration.

---

### **📄 License**

This project is intended for educational and portfolio purposes.


---

