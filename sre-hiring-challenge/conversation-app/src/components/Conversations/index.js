import React, { useEffect, useState } from 'react';
import styles from './Conversations.module.css';
import Conversation from '../Conversation';

function Conversations() {
  const [conversations, setConversations ] = useState([]);
  useEffect(() => {
    fetch('http://localhost:5000/conversations')
      .then(function(response) {
        return response.json();
      })
      .then(function(myJson) {
        setConversations(myJson)
      });
  }, []);
  return (
    <div className={styles.container}>
      {conversations.map(conversation => {
        return <Conversation conversation={conversation} key={conversation.id} />
      })}
    </div>
  );
}

export default Conversations;
