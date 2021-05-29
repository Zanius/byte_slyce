import React from "react";
import UrlForm from "./UrlForm"
import Header from "./Header"
import background from "../../static/images/background.png";

const Root = () => {
  return (
    <div className="w-screen h-screen p-52 bg-cover bg-fixed flex flex-col space-y-8" style={{backgroundImage: `url(${background})`}}>
      <Header/>
      <UrlForm/>
    </div>
  );
}

export default Root