import { BrowserRouter as Router, Switch, Route } from "react-router-dom";
import { NotFound } from "./components/Not-Found";
import { PrivateRoute } from "./components/PrivateRoute";
import Home from "./pages/home";
import Login from "./pages/login";

function App() {
  return (
    <div className="App">
      <Router>
        <Switch>
          <Route path="/login" component={Login} />
          <PrivateRoute path="/" component={Home} />
          {/* <Route path="/truck" component={Trucks} /> */}
          {/* <Route path="/driver" exact component={Drivers} /> */}
          {/* <Route path="/driver/add" exact component={AddForm} /> */}
          {/* <Route path="/driver/update/:id" component={AddForm} /> */}

          <Route component={NotFound} />
        </Switch>
      </Router>
    </div>
  );
}

export default App;
