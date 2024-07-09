# AI Chatbot

---

This repository contains an AI chatbot application built with Node.js, Express, React, and integrated with the llama3 model from ollama. The chatbot allows users to interact with an AI assistant in real-time through a web interface.

## Features

### Backend (Node.js/Express)

- **REST API Endpoints**: Handles user messages and maintains conversation history.
- **Integration with AI Model**: Communicates with the llama3 model via HTTP requests using Axios.
- **Conversation Management**: Stores and processes user interactions and AI responses.

### Frontend (React)

- **Interactive Chat Interface**: Provides a responsive UI where users can chat with the AI assistant.
- **Message Formatting**: Supports markdown for formatting AI responses.

## Technologies Used

- **Backend**: Node.js, Express.js, Axios, ollama integration
- **Frontend**: React.js, styled-components

## Getting Started

To get a local copy up and running, follow these steps:

1. **Install ollama**: Follow the installation instructions on the [ollama website](https://ollama.com).
2. **Clone the repository**
   ```bash
   git clone https://github.com/Fahmid-Chowdhury/AI-Chatbot.git
   ```
3. **Install dependencies**
   ```bash
   cd AI-Chatbot
   npm install
   cd frontend
   npm install
   ```

## Usage

1. **Start the backend server**
   ```bash
   nodemon
   ```
3. **Start the frontend**
   ```bash
   cd fronten
   npm start
   ```
4. Open your browser and navigate to `[http://localhost:5000]` to access the chatbot application.

## Customizing Models

Explore the [ollama documentation](https://github.com/ollama/ollama/blob/main/docs/modelfile.md) for instructions on customizing and creating your own AI models.

## Contributing

Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contact

Fahmid Chowdhury - [GitHub](https://github.com/Fahmid-Chowdhury)

Project Link: [https://github.com/Fahmid-Chowdhury/AI-Chatbot](https://github.com/Fahmid-Chowdhury/AI-Chatbot)
