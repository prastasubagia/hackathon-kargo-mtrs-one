import { BrowserRouter as Router, Switch, Route } from "react-router-dom";

import Drivers from "./pages/drivers";
import { NotFound } from "./components/Not-Found";
import DetailsPage  from "./components/DetailsPage";
import AddForm from "./pages/drivers/components/AddForm";

function App() {
  return (
    <div className="App">
      <Router>
        <Switch>
          <Route path="/driver" exact>
            <Drivers />
          </Route>
          {/* <Route path="/truck">
            {role === "transporter" ? <Trucks /> : <Login />}
          </Route> */}
          <Route path="/driver" exact component={Drivers} />
          <Route path="/driver/:id" exact component={DetailsPage} />
          <Route path="/driver/add" exact component={AddForm} />
          {/* <Route path="/driver/update/:id" component={AddForm} /> */}
          <Route component={NotFound} />
        </Switch>
      </Router>
    </div>
  );
}

export default App;
