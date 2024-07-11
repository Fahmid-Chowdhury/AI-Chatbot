# AI Chatbot

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

1. **Clone the repository**
   ```bash
   git clone https://github.com/Fahmid-Chowdhury/AI-Chatbot.git
   cd AI-Chatbot
   ```

2. **Setup the Application**
   - For the first time setup, run `setup.bat` to install dependencies, including Node.js, ollama, and the llama3 model. This script will guide you through the initial setup process.
     ```bash
     setup.bat
     ```

3. **Starting the Application**
   - After the initial setup, you can start the application using `start.bat` to run the backend and frontend servers.
     ```bash
     start.bat
     ```

## Usage

Once the setup is completed and the application is running, follow these steps to use the AI chatbot:

- Interact with the chatbot interface in your web browser. Send messages and receive responses powered by the llama3 model integrated with Node.js and React.

## Customizing Models

Explore the [ollama documentation](https://github.com/ollama/ollama/blob/main/docs/modelfile.md) for instructions on customizing and creating your own AI models.

## Contributing

Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Contact

Fahmid Chowdhury - [GitHub](https://github.com/Fahmid-Chowdhury)

Project Link: [https://github.com/Fahmid-Chowdhury/AI-Chatbot](https://github.com/Fahmid-Chowdhury/AI-Chatbot)
