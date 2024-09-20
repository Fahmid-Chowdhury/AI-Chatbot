import { useState, useEffect, useRef } from 'react'
import axios from 'axios';
import { marked } from 'marked';
import SendIcon from './icon';
import './App.scss'

function App() {
  const [messages, setMessages] = useState([
  ]);
  const [input, setInput] = useState('');
  const [loading, setLoading] = useState(false);
  const chatEndRef = useRef(null);

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
    chatEndRef.current?.scrollIntoView({ behavior: 'smooth' , block : 'end' });


  };

  const sendMessage = async () => {
    if (loading) return;

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
      displayMessage('LLama', assistantMessage);
    } catch (error) {
      console.error('Error:', error.message);
      displayMessage('LLama', 'Error occurred, please try again later.');
    } finally {
      setLoading(false);
    }
  };

  return (
    <>
      <div className="chat-container">
        <div className="chat">
          {messages.map((message, index) => (
            <div key={index} className={`message ${message.role}`}>
              {
                message.role === 'LLama' && (
                  <div className="profile">L</div>
                )
              }
              <div
                        className="message-content"
                        dangerouslySetInnerHTML={{ __html: marked.parse(message.content) }}
                    />
              {
                message.role === 'user' && (
                  <div className="profile">U</div>
                )
              }
            </div>
          ))}
          {
            loading && (
              <div className="message LLama">
                <div className="profile">L</div>
                <div className="message-content">
                <div className="lds-ellipsis"><div></div><div></div><div></div><div></div></div>
                </div>
              </div>
            )
          }
          <div ref={chatEndRef} ></div>
        </div>
        <div className="input-container">
          <input
            className="input"
            type="text"
            placeholder="Type a message..."
            value={input}
            onChange={(e) => setInput(e.target.value)}
            onKeyPress={(e) => e.key === 'Enter' && sendMessage()}
          />
          <button className="send-button" onClick={sendMessage} disabled={loading}>
          <SendIcon />
          </button>
        </div>
      </div>
    </>
  )
}

export default App
