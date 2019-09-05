import React, { useEffect, useState } from 'react';
import styles from './Messages.module.css';
import { withRouter } from 'react-router-dom';
import Message from '../Message';

function Messages({match: { params: { conversationId }}}) {
  const conversationsUrl = `http://localhost:5000/conversations/${conversationId}/messages`;
  const [messages, setMessages ] = useState([]);
  const [newMessage, setNewMessage ] = useState('');
  useEffect(() => {
    fetch(conversationsUrl)
      .then(function(response) {
        return response.json();
      })
      .then(function(responseMessages) {
        setMessages(responseMessages);
      });
  }, [conversationsUrl]);

  const onChange = (e) => {
    setNewMessage(e.target.value);
  };

  const handleKeyDown = (e) => {
    if (e.key === 'Enter') {
      console.log('do validate');
      fetch(conversationsUrl, {
        method: 'POST',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({content: newMessage})
      })
        .then(function(response) {
          return response.json();
        })
        .then(function(echoMessage) {
          setMessages([...messages, echoMessage]);
        });
    }
  };

  return (
    <div className={styles.container}>
      <ul>
      {messages.map(message => {
        return <Message message={message} key={message.id} />
      })}
      </ul>
      <div className={styles.inputContainer}>
        <input className={styles.input} onKeyDown={handleKeyDown} onChange={onChange} value={newMessage} />
      </div>
    </div>
  );
}

export default withRouter(Messages);
