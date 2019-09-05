import React from 'react';
import styles from './App.module.css';
import { BrowserRouter as Router, Route } from "react-router-dom";
import Conversations from './components/Conversations';
import Messages from './components/Mesagges';

function App() {
  return (
    <div className={styles.container}>
      <Router>
        <Conversations />
        <Route exact path="/:conversationId" component={Messages} />
      </Router>
    </div>
  );
}

export default App;
