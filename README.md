# **Moonify.ai 🌙**
<p align="center">
  <img src="https://github.com/user-attachments/assets/6cacb68e-cfca-4b49-94fe-fc74878b6912" alt="Moonify Icon" width="100">
  <br>
  <strong>Moonify.ai 🌙 - Your Complete Guide to Moon Phases and Lunar Calendar</strong>
</p>

---

## **Overview**
Moonify.ai is a beautifully designed iOS application that provides real-time information about moon phases, a lunar calendar, and interactive AI chat. This app serves as your lunar buddy, offering accurate and aesthetically pleasing details about the moon and its phases.

---

## **Key Features**
- **Splash Screen**: A minimalist splash screen with the Moonify.ai logo.
- **Real-Time Moon Details**:
  - Current moon phase, illumination, moonrise, and moonset.
  - Beautiful UI with light and dark yellow-themed cards.
- **Lunar Calendar**:
  - Displays moon phases for the entire year.
  - Highlights the current month and date.
- **Chat with GPT**:
  - Seamless integration with GPT-4 for lunar and general queries.
  - Modern chat UI with light and dark yellow themes.
  - Supports natural language conversation.
- **Navigation**:
  - Floating navigation bar with tabs for Moon Details, Chat, and Calendar.

---

## **Screenshots**
### Splash Screen
<p align="center">
  <img src="https://github.com/user-attachments/assets/8c5e7544-422b-40fb-96a9-1e3c3f3718f0" alt="Splash Screen" width="200">
  <img src="https://github.com/user-attachments/assets/4d44895b-9641-4d9d-8bff-2e1fa6bbb566" alt="Moon Details" width="200">
  <img src="https://github.com/user-attachments/assets/b1890fa2-eb27-4d4f-94d7-a51145bcfadc" alt="Lunar Calendar" width="200">
  <img src="https://github.com/user-attachments/assets/cc0383c7-0341-45e1-b490-2dca742a7ed2" alt="Moonify Buddy" width="200">
</p>

---

## **Technology Stack**
- **Frontend**: SwiftUI
- **Backend**: GPT-4o-mini API for chat functionality
- **APIs**:
  - Moon Phase API for real-time lunar data.
  - GPT API for interactive chat.
- **Frameworks**: Combine for state management.

---

## **Installation**
1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/moonify-ai.git
   cd moonify-ai
2. Open `moonify.ai.xcodeproj` in Xcode.
3. Add your API keys:
   - Navigate to `ChatViewModel.swift` and add your OpenAI API key.
   - Navigate to `MoonViewModel.swift` and add your Moon Phase API key.
4. Run the project on a simulator or device.

---

## **How It Works**
### Moon Details
- Fetches real-time lunar data from the Moon Phase API.
- Displays dynamic information in a modern UI.

### Lunar Calendar
- Fetches yearly lunar calendar data.
- Highlights the current month and date for quick reference.

### Chat
- Users can ask lunar-related questions or general queries.
- Integrated with GPT-4 for intelligent responses.
- User and bot messages are styled with yellow-themed bubbles.

---

## **Guidelines**
- Ensure all API keys are stored securely.
- For customization:
  - Modify the color scheme in `Constants.swift`.
  - Update the logo and app icon in the assets folder.
- Follow the MVC (Model-View-Controller) architecture for scalability.
- Test the app on multiple devices to ensure compatibility.

---

## **Contributors**
- **Shinjan Patra** - iOS Developer & Designer & AI Guy lol

---

## **License**
This project is licensed under the MIT License. See the [LICENSE](LICENSE.md) file for details.
