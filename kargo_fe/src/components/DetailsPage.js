import { Form, Button, Container } from "react-bootstrap";

import {useEffect, useState} from 'react';
import { LoadingIndicator } from "../components/Loading-Indicator";
import { getDriver } from "../apis/driver.api";
import { Header } from "./Header";
import { Footer } from "./Footer";



const DetailsPage = (props) =>{

   console.log("props",props.match.params.id);
    const id = props.match.params.id;
    const [data, setData] = useState();
   
    useEffect(() => {
        (async () => {
          const response = await getDriver(id);
          // response.data.map((x) => (x.status = x.status ? "Active" : "Inactive"));
          // console.log(response);
        //  console.log("response",response.data)
          setData(response.data);
        
        })();
      }, []);

     return (

        <div>
        <Header />
        <div className="main-layout py-5">
        <Container>
             {data ? (
             <Form>
             <Form.Group>
               <Form.Control
                 type="text"
                 placeholder="Name"
                 name="name"
                 value={data.driver_name}
                 disabled
               />
             </Form.Group>
             <Form.Group>
               <Form.Control
                 type="text"
                 placeholder="Driver Lisensi"
                 name="driver_license"
                 value={data.driver_license}
                 disabled
               />
             </Form.Group>
             <Form.Group>
               <Form.Control
                 type="text"
                 placeholder="Phone Number"
                 name="phone_number"
                 value={data.phone_number}
                 disabled
               />
             </Form.Group>
             <Form.Group>
               <Form.Control
                 as="select"
                 name="status"
                 value={data.status}
                 disabled
               >
                 <option>True</option>
                 <option>False</option>
               </Form.Control>
             </Form.Group>
             <Form.Group>
             <Form.Label>Document</Form.Label>
    <Form.Control type="input" placeholder="document" />
             </Form.Group>
           </Form>
          ) : (
            <LoadingIndicator />
          )}
          </Container>
        </div>
        <Footer />
      </div>
          

     )
}

export default DetailsPage;