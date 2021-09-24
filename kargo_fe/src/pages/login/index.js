import { useState } from "react";
import { Button, Card, Form } from "react-bootstrap";
import { useHistory } from "react-router";
import { LOCAL_CONSTANTS } from "../../constants";

const Login = () => {
  const history = useHistory();
  const [type, setType] = useState();
  const [username, setUser] = useState("");

  const onInputChange = (value) => {
    setType(value);
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    localStorage.setItem(LOCAL_CONSTANTS.STORAGE_KEY_LOGIN_TYPE, type);
    localStorage.setItem(LOCAL_CONSTANTS.STORAGE_KEY_USERNAME, username);
    history.push("/");
  };

  return (
    <div className="d-flex flex-row justify-content-center min-vh-100">
      <Card className="d-flex flex-column my-auto w-25">
        <Form onSubmit={handleSubmit}>
          <Card.Header className="bg-dark text-light p-3">
            LOGIN - KARGO HACK01
          </Card.Header>
          <Card.Body>
            <div className="d-flex flex-row py-3">
              <span className="flex-1">Roles</span>
              <div className="px-5">
                <Form.Check
                  type="radio"
                  name="login-type"
                  id="transporter"
                  label="Transporter"
                  value="transporter"
                  onChange={(e) => onInputChange(e.target.value)}
                />
                <Form.Check
                  type="radio"
                  name="login-type"
                  id="shipper"
                  label="Shipper"
                  value="shipper"
                  onChange={(e) => onInputChange(e.target.value)}
                />
              </div>
            </div>
            <Form.Group>
              <Form.Control
                type="text"
                placeholder="Username *"
                name="username"
                value={username}
                onChange={(e) => setUser(e.target.value)}
                required
              />
            </Form.Group>
          </Card.Body>

          <Card.Footer className="p-3">
            <Button
              variant="success"
              type="submit"
              block
              disabled={type === null || username === ""}
            >
              Login
            </Button>
          </Card.Footer>
        </Form>
      </Card>
    </div>
  );
};

export default Login;
