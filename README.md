# AI Meal Planner

AI Meal Planner is an iOS application that generates personalized meal plans using artificial intelligence.

The app analyzes user preferences, dietary restrictions, and calorie goals to generate daily or weekly meal plans.
The project integrates the **OpenAI API** to provide intelligent meal recommendations.

## Features

- Onboarding flow
- User preference setup
- AI-powered meal generation
- Daily meal plan
- Weekly meal plan
- Modern and intuitive UI

## Tech Stack

- Swift
- SwiftUI
- MVVM Architecture
- OpenAI API
- Xcode

## Architecture

The project follows the **MVVM (Model–View–ViewModel)** architecture pattern.

- **Model** – represents meals, ingredients, and user preferences  
- **View** – SwiftUI UI components  
- **ViewModel** – manages state, API calls, and business logic  

This architecture helps keep the UI separate from the application logic.

## AI Integration

The application uses the **OpenAI API** to generate personalized meal recommendations.

The user’s preferences (diet type, calorie goal, allergies, etc.) are sent to the API, and the response is used to build a meal plan.

## App Flow

1. User goes through onboarding
2. User selects diet preferences and restrictions
3. The app sends a request to the OpenAI API
4. AI generates a personalized meal plan
5. The user can view daily or weekly plans

## Screens

- Onboarding
- Preferences setup
- Daily meal plan
- Weekly meal plan

## Future Improvements

- Save favorite meals
- Nutrition analytics
- Meal history
- User authentication

## How to Run the Project

1. Clone the repository
2. Add your OpenAI API key
3. Open the project in Xcode
4. Run the app on a simulator or device

## Author

GitHub: https://github.com/kgm1918
