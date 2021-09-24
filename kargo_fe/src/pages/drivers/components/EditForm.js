import { Form, Button, Container } from "react-bootstrap";

import { useState } from "react";
import { editDriver } from "../../../apis/driver.api";
// import { Header } from "../../../components/Header";
// import { Footer } from "../../../components/Footer";

const EditForm = ({ driver }) => {
  const id = driver.id;
  const [name, setName] = useState(driver.name);
  const [phone_number, setPhone] = useState(driver.phone_number);
  const [status, setStatus] = useState(driver.status);

  const updatedDriver = { name, phone_number, status };

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log(updatedDriver);
    editDriver(id, updatedDriver);
  };

  return (
    <div>
      {/* <Header /> */}
      <div className="main-layout py-5">
        <Container>
          <Form onSubmit={handleSubmit}>
            <Form.Group>
              <Form.Control
                type="text"
                placeholder="Name *"
                name="name"
                value={name}
                onChange={(e) => setName(e.target.value)}
                required
              />
            </Form.Group>
            <Form.Group>
              <Form.Control
                type="text"
                placeholder="Phone Number *"
                name="phone_number"
                value={phone_number}
                onChange={(e) => setPhone(e.target.value)}
                required
              />
            </Form.Group>
            <Form.Group>
              <Form.Control
                as="select"
                name="status"
                value={status}
                onChange={(e) => setStatus(e.target.value)}
              >
                <option>True</option>
                <option>False</option>
              </Form.Control>
            </Form.Group>
            <Button variant="success" type="submit" block>
              Edit Driver
            </Button>
          </Form>
        </Container>
      </div>
      {/* <Footer /> */}
    </div>
  );
};

export default EditForm;
