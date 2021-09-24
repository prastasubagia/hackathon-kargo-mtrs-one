import React from "react";
import { Route, Redirect } from "react-router-dom";
import { LOCAL_CONSTANTS } from "../constants";

export const PrivateRoute = ({ component: Component, roles, ...rest }) => (
  <Route
    {...rest}
    render={(props) => {
      const role = localStorage.getItem(LOCAL_CONSTANTS.STORAGE_KEY_LOGIN_TYPE);
      if (!role) {
        return (
          <Redirect
            to={{ pathname: "/login", state: { from: props.location } }}
          />
        );
      }

      // if (roles && roles.indexOf(currentUser.role) === -1) {
      //     return <Redirect to={{ pathname: '/'}} />
      // }

      return <Component {...props} />;
    }}
  />
);
