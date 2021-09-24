import { BrowserRouter as Router, Switch, Route } from "react-router-dom";
import { NotFound } from "./components/Not-Found";
import { PrivateRoute } from "./components/PrivateRoute";
import { LOCAL_CONSTANTS } from "./constants";
import Home from "./pages/home";
import Login from "./pages/login";
import Trucks from "./pages/trucks";
import AddTruck from "./pages/trucks/components/AddForm";
import EditTruck from "./pages/trucks/components/EditForm";
import ViewTruck from "./pages/trucks/components/ViewForm";

import Drivers from "./pages/drivers";
import DetailsPage from "./components/DetailsPage";
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
            exact
          />
          <PrivateRoute
            path="/truck/add"
            roles={[LOCAL_CONSTANTS.ROLE.TRANSPORTER]}
            component={AddTruck}
          />
          <PrivateRoute
            path="/truck/edit/:id"
            roles={[LOCAL_CONSTANTS.ROLE.TRANSPORTER]}
            component={EditTruck}
          />
          <PrivateRoute
            path="/truck/:id"
            roles={[LOCAL_CONSTANTS.ROLE.TRANSPORTER]}
            component={ViewTruck}
          />

          <Route path="/driver" exact component={Drivers} />
          <Route path="/driver/:id" exact component={DetailsPage} />
          <Route path="/driver/add" exact component={AddForm} />

          <Route path="/not-found" component={NotFound} />
        </Switch>
      </Router>
    </div>
  );
}

export default App;
