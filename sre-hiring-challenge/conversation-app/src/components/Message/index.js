import React, { useContext } from 'react';
import styles from './Message.module.css';
import { UserContext } from '../../providers/UserProvider';

function Message({ message }) {
  const user = useContext(UserContext);
  if(!user) {
    return;
  }
  const isCurrentUser = user.id === message.participant.id;
  return (
  <li className={isCurrentUser ? styles.me : styles.participant}>
    {message.content}
  </li>
  );
}

export default Message;
