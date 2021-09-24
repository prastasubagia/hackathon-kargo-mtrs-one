import React from "react";
import { Container } from "react-bootstrap";

export const NotFound = () => {
  return (
    <div className="text-center py-4" style={{ backgroundColor: "#282c34" }}>
      <Container>
        <h1 className="display-2 text-white">404 Page Not Found</h1>
        <a href="/">Return to Home Page</a>
      </Container>
    </div>
  );
};
