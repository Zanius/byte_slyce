// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
const _css = require("../css/app.scss");
// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import deps with the dep name or local files with a relative path, for example:
//
//     import {Socket} from "phoenix"
//     import socket from "./socket"
//
import "phoenix_html"
import React from "react";
import ReactDOM from "react-dom";
import Root from "./components/Root";

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  const errorPage = document.getElementById("error-page");
  if (root) {
    ReactDOM.render(<Root />, root);
  } else if (errorPage) {
    ReactDOM.render(<Root error={true} />, errorPage);
  }
});