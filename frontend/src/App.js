import React from 'react';
import styled from 'styled-components';
import Chat from './Chat';

const AppContainer = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #f0f0f0;
`;

const App = () => {
  return (
    <AppContainer>
      <Chat />
    </AppContainer>
  );
};

export default App;