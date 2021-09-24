import React from "react";

import { Container, Nav, Navbar } from "react-bootstrap";
import { FaSignOutAlt } from "react-icons/fa";
import { useHistory } from "react-router";
import { LOCAL_CONSTANTS } from "../constants";

export const Header = () => {
  const history = useHistory();
  const role = localStorage.getItem(LOCAL_CONSTANTS.STORAGE_KEY_LOGIN_TYPE);
  const links =
    role === "transporter"
      ? [
          { url: "/shipments", label: "Shipments" },
          { url: "/trucks", label: "Trucks" },
          { url: "/drivers", label: "Drivers" },
        ]
      : [{ url: "/shipments", label: "Shipments" }];

  const handleLogout = (e) => {
    if (e.type === "click") {
      localStorage.clear();
      history.push("/login");
    }
  };

  return (
    <Navbar collapseOnSelect expand="lg" bg="dark" variant="dark">
      <Container>
        {/* <Logo /> */}
        <Navbar.Brand href="#home">KARGO HACK01</Navbar.Brand>
        <Navbar.Toggle aria-controls="responsive-navbar-nav" />
        <Navbar.Collapse id="responsive-navbar-nav">
          <Nav className="me-auto border-left">
            {links.map((link) => (
              <Nav.Link key={`link-${link.label}`} href={link.url}>
                {link.label}
              </Nav.Link>
            ))}
          </Nav>
          <Nav className="me-auto ml-auto">
            <Nav.Link onClick={(e) => handleLogout(e)}>
              Logout
              <FaSignOutAlt className="ml-2" />
            </Nav.Link>
          </Nav>
        </Navbar.Collapse>
      </Container>
    </Navbar>
  );
};
