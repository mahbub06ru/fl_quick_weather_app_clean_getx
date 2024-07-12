# Quick Weather App

Quick Weather App is a basic Flutter application that fetches and displays weather data from the OpenWeatherMap API based on user input (city name). This project demonstrates skills in Flutter development, API integration, and basic UI design.

## Features

- Search for weather data by city name
- Display current weather information including:
    - City name
    - Temperature
    - Weather condition (e.g., Clear, Rainy, Snowy)
    - An icon representing the current weather condition
- Handle errors such as invalid city names, network issues, and no results found
- Clean and user-friendly interface

## Project Structure

The project follows the Clean Architecture principles, dividing the code into three main layers:

1. **Data Layer**: Responsible for data retrieval, transformation, and storage.
2. **Domain Layer**: Contains the core business logic and domain entities.
3. **Presentation Layer**: Manages the UI and user interactions.
4. **State management**: Popular GetX is used.

### Data Layer

- `weather_data_sources.dart`: Contains the data source implementation for fetching weather data from the OpenWeatherMap API.
- `weather_model.dart`: Defines the data models for parsing JSON responses from the API.
- `weather_repository_impl.dart`: Implements the repository pattern for interacting with data sources.

### Domain Layer

- `weather_entity.dart`: Defines the weather entity using the Equatable package for value comparisons.
- `weather_repository.dart`: Declares the repository interface for weather data.
- `weather_usecase.dart`: Implements the use case for fetching weather data.

### Presentation Layer

- `home_page.dart`: The main UI page containing the search bar and displaying weather data or error messages.
- `weather_controller.dart`: Manages the state and business logic for the WeatherPage using the GetX package.

## Setup Instructions

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) (version 2.0 or higher)
- An IDE such as [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/)

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/quick-weather-app.git
   cd quick-weather-app
   
2. **Install dependencies**:
   ```bash
   flutter pub get
   
3. **Set up the OpenWeatherMap API key:**:
   ```bash
   Sign up on OpenWeatherMap to get your API key.
   Create a .env file in the root directory and add your API key:
   makefile
   Copy code
   API_KEY=your_openweathermap_api_key
   Update the weather_data_sources.dart file to read the API key from the environment file.
   
4. **Run the app:**:
   ```bash
   flutter run
   
### Explanation of the Approach
- Clean Architecture
- The project is structured following the Clean Architecture principles to ensure separation of concerns, testability, and maintainability. The architecture is divided into three main layers:

- Data Layer: Responsible for data retrieval from the OpenWeatherMap API, parsing the JSON response, and providing data to the domain layer. This layer uses the repository pattern to abstract data sources.

- Domain Layer: Contains the business logic and domain entities. It defines the repository interfaces and use cases. The use case encapsulates the logic for fetching weather data, making the application easier to maintain and test.

- Presentation Layer: Manages the UI and user interactions. It uses the GetX package for state management, providing a reactive and efficient way to handle UI updates. The WeatherController interacts with the domain layer to fetch weather data and update the UI accordingly.

### Error Handling
- The application handles various error scenarios such as invalid city names, network issues, and no results found. Appropriate error messages are displayed to the user, ensuring a smooth user experience.

### UI Design
- The UI is designed to be clean and user-friendly. The search bar allows users to input city names and fetch weather data. The weather information is displayed with the city name, temperature, and weather condition. Error messages are shown when necessary, guiding the user to correct any issues.

- By following this approach, the Quick Weather App is well-structured, maintainable, and provides a good user experience. 
   