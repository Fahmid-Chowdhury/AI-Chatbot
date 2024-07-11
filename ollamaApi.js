const express = require('express');
const axios = require('axios');
const cors = require('cors');
const bodyParser = require('body-parser'); 

const app = express();
const port = 5000;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.json());
app.use(cors());

app.post('/api/reset', (req, res) => {
  conversationHistory = [];
  res.json({ message: 'Conversation history reset.' });
});

app.post('/api/chat', async (req, res) => {
    const { model, messages, options, stream, keep_alive } = req.body;
    let conversationHistory = [];
    // Validate request body
    if (!model || !messages || !Array.isArray(messages)) {
        return res.status(400).json({ error: 'Model and messages are required fields' });
    }

    // Add new messages to conversation history
    conversationHistory.push(...messages);
    console.log('Conversation history:', conversationHistory);

    // Prepare user message from conversation history
    const userMessage = conversationHistory.map(msg => `${msg.role}: ${msg.content}`).join('\n');
    console.log('User message:', userMessage);

    try {
        // Send user message to llama3 model via axios
        const response = await axios.post('http://localhost:11434/api/generate', {
            model: 'llama3',
            prompt: userMessage,
            stream: false,
        });

        console.log('Model response:', response.data);
        const assistantMessage = response.data.response || 'No response from model';

        // Add assistant's response to conversation history
        conversationHistory.push({ role: 'assistant', content: assistantMessage });

        // Construct response to client
        res.json({
            id: 'chatcmpl-123',
            object: 'chat.completion',
            created: Date.now(),
            model: 'llama3',
            choices: [
                {
                    message: {
                        role: 'assistant',
                        content: assistantMessage
                    },
                    finish_reason: 'stop'
                }
            ],
            usage: {
                prompt_tokens: userMessage.length,
                completion_tokens: assistantMessage.length,
                total_tokens: userMessage.length + assistantMessage.length
            }
        });
    } catch (error) {
        console.error('Error:', error.message);
        res.status(500).json({ error: error.message });
    }
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
