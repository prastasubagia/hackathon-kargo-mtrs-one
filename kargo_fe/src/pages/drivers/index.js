import { useEffect, useMemo, useState } from "react";
import {
  Button,
  Container,
  Modal,
  OverlayTrigger,
  Tooltip,
} from "react-bootstrap";
import { useHistory } from 'react-router-dom';
import { getDrivers } from "../../apis/driver.api";
import { Footer } from "../../components/Footer";
import { Header } from "../../components/Header";
import { LoadingIndicator } from "../../components/Loading-Indicator";
import { TableContainer } from "../../components/TableContainer";
// import Driver from "./components/driver";
import { FaCircle, FaEdit, FaTrash } from "react-icons/fa";
import EditForm from "./components/EditForm";

function Drivers() {
  const history = useHistory();
  const [show, setShow] = useState(false);
  const [driver, setDriver] = useState();
  const handleShow = (driver) => {
    // console.log(driver);
    setShow(true);
    setDriver(driver);
  };
  const handleClose = () => setShow(false);
  //const a = history.push(`/driver/${props.data[0].id}`);
  const columns = useMemo(
    () => [
      {
        Header: "Driver Name",
        accessor: "driver_name",

        Cell: (props) => {
          return (
            
            <a href={`/driver/${props.data[props.row.id].id}`} class="active">
              {props.value}
            </a>
          );
        },
      },
      {
        Header: "Phone Number",
        accessor: "phone_number",
      },
      {
        Header: "Status",
        accessor: "status",
        Cell: (props) => {
          return props.value ? (
            <div>
              <FaCircle className="text-success mr-1" />
              Active
            </div>
          ) : (
            <div>
              <FaCircle className="text-muted mr-1" />
              Inactive
            </div>
          );
        },
      },
      {
        Header: "Action",
        accessor: "id",
        disableSortBy: true,
        Cell: (props) => {
          return (
            <div className="d-flex flex-row">
              <div id="edit">
                <OverlayTrigger
                  id="edit"
                  overlay={<Tooltip id={`tooltip-top`}>Edit</Tooltip>}
                >
                  <button
                    id="edit"
                    // onClick={handleShow(props.value)}
                    className="btn text-warning btn-act"
                    data-toggle="modal"
                  >
                    <FaEdit id="edit" />
                  </button>
                </OverlayTrigger>
              </div>

              <div id="delete">
                <OverlayTrigger
                  id="delete"
                  overlay={<Tooltip id={`tooltip-top`}>Delete</Tooltip>}
                >
                  <button
                    // onClick={() => deleteEmployee(driver.id)}
                    id="delete"
                    className="btn text-danger btn-act"
                    data-toggle="modal"
                  >
                    <FaTrash id="delete" />
                  </button>
                </OverlayTrigger>
              </div>
            </div>
          );
        },
      },
    ],
    []
  );

  const [data, setData] = useState([]);

  useEffect(() => {
    (async () => {
      const response = await getDrivers();
      // response.data.map((x) => (x.status = x.status ? "Active" : "Inactive"));
      // console.log(response);
      setData(response.data);
    })();
  }, []);

  // other template
  // const indexOfLastEmployee = currentPage * employeesPerPage;
  // const indexOfFirstEmployee = indexOfLastEmployee - employeesPerPage;
  // const currentEmployees = sortedEmployees.slice(indexOfFirstEmployee, indexOfLastEmployee);
  // const totalPagesNum = Math.ceil(sortedEmployees.length / employeesPerPage);

  // useEffect(() => {
  //   (async () => {
  //     const response = await getDrivers();
  //     // console.log(response);
  //     setData(response.data);
  //   })();
  // }, []);

  return (
    <div>
      <Header />
      <div className="main-layout py-5">
        <Container>
          {data ? (
            <TableContainer
              columns={columns}
              data={data}
              title="driver"
              rowProps={(row) => ({
                onClick: (event) => {
                  // alert(JSON.stringify(row.values))
                  // console.log(row, event);
                  switch (event.target.id) {
                    case "edit":
                      //console.log(row.values);
                      handleShow(row.values);
                      break;
                    case "delete":
                      break;

                    default:
                      break;
                  }
                },
                // style: {
                //   cursor: "pointer",
                // },
              })}
            />
          ) : (
            // <table className="table table-bordered table-striped table-hover">
            //   <thead>
            //     <tr>
            //       <th>ID</th>
            //       <th>Name</th>
            //       <th>Phone Number</th>
            //       <th>Status</th>
            //       <th>Actions</th>
            //     </tr>
            //   </thead>
            //   <tbody>
            //     {data.map((driver) => (
            //       <tr key={driver.id}>
            //         <Driver driver={driver} />
            //       </tr>
            //     ))}
            //   </tbody>
            // </table>
            <LoadingIndicator />
          )}
        </Container>
      </div>
      <Footer />

      <Modal show={show} onHide={handleClose}>
        <Modal.Header closeButton>
          <Modal.Title>Edit Driver</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <EditForm driver={driver} />
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={handleClose}>
            Close Button
          </Button>
        </Modal.Footer>
      </Modal>
    </div>
  );
}

export default Drivers;
