import React, {useContext} from 'react';
import styles from './Conversation.module.css';
import { Link } from "react-router-dom";
import { UserContext } from '../../providers/UserProvider';

function Conversation({ conversation }) {
  const user = useContext(UserContext);
  if(!user) {
    return;
  }
  const participant = conversation.participants.filter((p) => p.id !== user.id)[0];
  const participantFullName = `${participant.first_name} ${participant.last_name}`;
  return (
    <Link className={styles.container} to={`${conversation.id}`}>
      <img alt={participantFullName} src={participant.avatar_url} className={styles.avatar} />
      <span className={styles.name}>{participantFullName}</span>
    </Link>
  );
}

export default Conversation;
