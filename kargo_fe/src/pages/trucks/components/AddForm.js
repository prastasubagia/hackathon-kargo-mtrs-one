import { Form, Button, Container } from "react-bootstrap";

import { Header } from "../../../components/Header";
import { Footer } from "../../../components/Footer";
import { useHistory } from "react-router";
import { createTruck } from "../../../apis/truck.api";
import { getTruckTypes } from "../../../apis/truck-type.api";
import React from "react";
import { LoadingIndicator } from "../../../components/Loading-Indicator";

const AddTruck = () => {
  const history = useHistory();
  const [truck, setTruck] = React.useState({
    license_number: "",
    license_type: "BLACK",
    production_year: "2021",
    stnk_path: "gpp.jpg",
    kir_path: "gpp.jpg",
    truck_type_id: "",
  });
  const [truckTypes, setDefaultTypes] = React.useState();

  React.useEffect(() => {
    (async () => {
      const response = await getTruckTypes();
      setDefaultTypes(response.data);
    })();
  }, []);

  const onInputChange = (e) => {
    setTruck({ ...truck, [e.target.name]: e.target.value });
  };

  const {
    license_number,
    license_type,
    production_year,
    stnk_path,
    kir_path,
    truck_type_id,
  } = truck;

  const handleSubmit = (e) => {
    e.preventDefault();
    (async () => {
      // console.log({
      //   license_number,
      //   license_type,
      //   production_year,
      //   stnk_path,
      //   kir_path,
      //   truck_type_id,
      // });

      const response = await createTruck({
        license_number,
        license_type,
        production_year,
        stnk_path,
        kir_path,
        truck_type_id,
      });
      if (response.status == 201) {
        console.log(response);
        history.push("/truck");
      }
    })();
  };

  return (
    <div>
      <Header />
      <div className="main-layout py-5">
        <Container className="w-25">
          <Form onSubmit={handleSubmit}>
            <Form.Group>
              <Form.Control
                type="text"
                placeholder="License Number *"
                name="license_number"
                value={license_number}
                onChange={(e) => onInputChange(e)}
              />
            </Form.Group>
            <Form.Group>
              {truckTypes ? (
                <Form.Control
                  as="select"
                  name="truck_type_id"
                  value={truck_type_id}
                  onChange={(e) => onInputChange(e)}
                >
                  <option value="null">Select Type *</option>
                  {truckTypes.map((link) => (
                    <option key={`option-${link.id}`} value={link.id}>
                      {link.name}
                    </option>
                  ))}
                </Form.Control>
              ) : (
                <LoadingIndicator />
              )}
            </Form.Group>
            <Form.Group>
              <Form.Control
                as="select"
                name="license_type"
                value={license_type}
                onChange={(e) => onInputChange(e)}
              >
                <option value="BLACK">BLACK</option>
                <option value="YELLOW">YELLOW</option>
              </Form.Control>
            </Form.Group>
            <Form.Group>
              <Form.Control
                type="text"
                placeholder="Production Year"
                name="production_year"
                value={production_year}
                onChange={(e) => onInputChange(e)}
              />
            </Form.Group>
            <Form className="mb-2">
              <Form.File id="custom-file" label="Custom file input" custom />
            </Form>
            <Form className="my-2">
              <Form.File id="custom-file" label="Custom file input" custom />
            </Form>
            <Button
              variant="success"
              type="submit"
              block
              disabled={license_number === "" || truck_type_id === ""}
            >
              Add Truck
            </Button>
          </Form>
        </Container>
      </div>
      <Footer />
    </div>
  );
};

export default AddTruck;
