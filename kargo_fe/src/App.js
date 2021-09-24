import { BrowserRouter as Router, Switch, Route } from "react-router-dom";
import { NotFound } from "./components/Not-Found";
import { PrivateRoute } from "./components/PrivateRoute";
import { LOCAL_CONSTANTS } from "./constants";
import Home from "./pages/home";
import Login from "./pages/login";
import Trucks from "./pages/trucks";

import Drivers from "./pages/drivers";
import { NotFound } from "./components/Not-Found";
import DetailsPage  from "./components/DetailsPage";
import AddForm from "./pages/drivers/components/AddForm";

function App() {
  return (
    <div className="App">
      <Router>
        <Switch>
          <Route path="/login" component={Login} />
          <PrivateRoute path="/" component={Home} exact />
          <PrivateRoute
            path="/trucks"
            roles={[LOCAL_CONSTANTS.ROLE.TRANSPORTER]}
            component={Trucks}
          />
          {/* <Route path="/truck" component={Trucks} /> */}
          {/* <Route path="/driver" exact component={Drivers} /> */}
          {/* <Route path="/driver/add" exact component={AddForm} /> */}
          {/* <Route path="/driver/update/:id" component={AddForm} /> */}

          <Route path="/not-found" component={NotFound} />
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
        </Switch>
      </Router>
    </div>
  );
}

export default App;
