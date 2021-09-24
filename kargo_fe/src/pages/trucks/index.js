import { useEffect, useMemo, useState } from "react";
import { Button, Container } from "react-bootstrap";
import { FaCircle, FaPlus } from "react-icons/fa";
import { Link } from "react-router-dom";
import { getTrucks } from "../../apis/truck.api";
import { Footer } from "../../components/Footer";
import { Header } from "../../components/Header";
import { LoadingIndicator } from "../../components/Loading-Indicator";
import { TableContainer } from "./components/TableContainer";

function Trucks() {
  const columns = useMemo(
    () => [
      {
        Header: "License Number",
        accessor: "license_number",
        Cell: (props) => <a href={`/truck/${props.row.id}`}>{props.value}</a>,
      },
      {
        Header: "Truck Type",
        accessor: "truck_type_label",
      },
      {
        Header: "Plate Type",
        accessor: "license_type",
      },
      {
        Header: "Production Year",
        accessor: "production_year",
      },
      {
        Header: "Status",
        accessor: "status",
        disableSortBy: true,
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
      // {
      //   Header: "STNK",
      //   accessor: "stnk_path",
      // },
      // {
      //   Header: "Type",
      //   accessor: "truck_type",
      // },
      // {
      //   Header: "KIR",
      //   accessor: "kir_path",
      // },
    ],
    []
  );

  const [data, setData] = useState();

  useEffect(() => {
    (async () => {
      const response = await getTrucks();
      response.data.map((x) => (x.truck_type_label = x.truck_type.name));
      // console.log(response.data);
      setData(response.data);
    })();
  }, []);

  return (
    <div>
      <Header />
      <div className="main-layout py-5">
        <Container>
          {data ? (
            <>
              <div className="d-flex flex-row justify-content-between mb-3">
                <Button
                  className="align-self-center"
                  variant="success"
                  href={`/truck/add`}
                >
                  <FaPlus className="mr-2" />
                  Add Truck
                </Button>
              </div>
              <TableContainer columns={columns} data={data} title="Truck" />
            </>
          ) : (
            <div className="text-center">
              <LoadingIndicator />
            </div>
          )}
        </Container>
      </div>
      <Footer />
    </div>
  );
}

export default Trucks;
