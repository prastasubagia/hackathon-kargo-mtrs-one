import * as React from "react";

export const LoadingIndicator = (props) => (
  <svg className="loading" viewBox="-24 -24 48 48" small={props.small}>
    <circle
      className="circle"
      cx="0"
      cy="0"
      r="20"
      fill="none"
      strokeWidth="4"
    ></circle>
  </svg>
);
