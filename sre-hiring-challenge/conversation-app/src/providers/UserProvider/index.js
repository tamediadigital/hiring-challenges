import React, {createContext, useState, useEffect} from 'react';
export const UserContext = createContext();

function UserProvider({ children }) {
  const [user, setUser ] = useState({});
  useEffect(() => {
    fetch('http://localhost:5000/user')
      .then(function(response) {
        return response.json();
      })
      .then(function(myJson) {
        setUser(myJson);
      });
  }, []);
  return (
    <UserContext.Provider value={user}> {children}</UserContext.Provider>
  );
}

export default UserProvider;

