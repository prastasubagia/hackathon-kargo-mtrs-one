import { useEffect, useMemo, useState } from "react";
import { Container } from "react-bootstrap";
import { getTrucks } from "../../apis/truck.api";
import { Footer } from "../../components/Footer";
import { Header } from "../../components/Header";
import { LoadingIndicator } from "../../components/Loading-Indicator";
import { TableContainer } from "../../components/TableContainer";

function Trucks() {
  const columns = useMemo(
    () => [
      {
        Header: "License Number",
        accessor: "license_number",
      },
      {
        Header: "License Type",
        accessor: "license_type",
      },
      {
        Header: "Production Year",
        accessor: "production_year",
      },
      {
        Header: "Status",
        accessor: "status",
      },
      {
        Header: "STNK",
        accessor: "stnk_path",
      },
      {
        Header: "Type",
        accessor: "truck_type",
      },
      {
        Header: "KIR",
        accessor: "kir_path",
      },
    ],
    []
  );

  const [data, setData] = useState([]);

  useEffect(() => {
    (async () => {
      const response = await getTrucks();
      response.data.map((x) => (x.status = x.status ? "Active" : "Inactive"));
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
            <TableContainer columns={columns} data={data} title="Truck" />
          ) : (
            <LoadingIndicator />
          )}
        </Container>
      </div>
      <Footer />
    </div>
  );
}

export default Trucks;
