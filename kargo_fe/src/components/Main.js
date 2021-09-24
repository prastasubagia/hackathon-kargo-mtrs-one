import React from "react";
import { Container } from "react-bootstrap";

export const Main = () => {
  return (
    <div className="text-center py-4" style={{ backgroundColor: "#282c34" }}>
      <Container>
        <h1 className="display-2 text-white">HOME</h1>
        <p className="lead text-white">Welcome to our dashboard.</p>
      </Container>
    </div>
  );
};
