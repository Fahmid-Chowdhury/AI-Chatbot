import React, { useState, useEffect } from 'react';
import axios from 'axios';
import styled from 'styled-components';
import * as marked from 'marked'; // Import all exports from marked

const ChatContainer = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  height: 80vh;
  width: 1000px;
  border: 1px solid #ccc;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
`;

const MessagesContainer = styled.div`
  flex: 1;
  padding: 10px;
  overflow-y: auto;
`;

const Message = styled.div`
  margin: 10px 0;
  text-align: ${(props) => (props.role === 'assistant' ? 'left' : 'right')};
  color: ${(props) => (props.role === 'assistant' ? '#000' : '#fff')};
  background-color: ${(props) => (props.role === 'assistant' ? '#e5e5ea' : '#007aff')};
  padding: 10px;
  border-radius: 10px;
  max-width: 100%;
  align-self: ${(props) => (props.role === 'assistant' ? 'flex-start' : 'flex-end')};
`;

const InputContainer = styled.div`
  display: flex;
  padding: 10px;
  border-top: 1px solid #ccc;
  background-color: #f9f9f9;
`;

const Input = styled.input`
  flex: 1;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  margin-right: 10px;
  outline: none;
`;

const Button = styled.button`
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  background-color: #007aff;
  color: white;
  cursor: pointer;

  &:disabled {
    background-color: #ccc;
    cursor: not-allowed;
  }
`;

const Chat = () => {
  const [messages, setMessages] = useState([]);
  const [input, setInput] = useState('');
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    const resetConversation = async () => {
      try {
        await axios.post('http://localhost:5000/api/reset');
        setMessages([]);
      } catch (error) {
        console.error('Error resetting conversation history:', error.message);
      }
    };

    resetConversation();
  }, []);

  const displayMessage = (role, content) => {
    setMessages((prevMessages) => [...prevMessages, { role, content }]);
  };

  const sendMessage = async () => {
    if (!input.trim()) return;

    const userMessage = { role: 'user', content: input };
    displayMessage('user', input);
    setInput('');
    setLoading(true);

    try {
      const response = await axios.post('http://localhost:5000/api/chat', {
        model: 'llama3',
        messages: [...messages, userMessage],
      });

      const assistantMessage = response.data.choices[0]?.message?.content || 'No response from server';
      displayMessage('assistant', assistantMessage);
    } catch (error) {
      console.error('Error:', error.message);
      displayMessage('assistant', 'Error occurred, please try again later.');
    } finally {
      setLoading(false);
    }
  };

  return (
    <ChatContainer>
      <MessagesContainer>
        {messages.map((msg, index) => (
          <Message key={index} role={msg.role}>
            <strong>{msg.role}</strong>: {msg.role === 'assistant' ? (
              <div dangerouslySetInnerHTML={{ __html: marked.parse(msg.content) }} />
            ) : (
              msg.content
            )}
          </Message>
        ))}
      </MessagesContainer>
      <InputContainer>
        <Input
          type="text"
          value={input}
          onChange={(e) => setInput(e.target.value)}
          placeholder="Type a message..."
        />
        <Button onClick={sendMessage} disabled={loading}>
          {loading ? 'Sending...' : 'Send'}
        </Button>
      </InputContainer>
    </ChatContainer>
  );
};

export default Chat;