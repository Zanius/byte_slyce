import React from "react";
import UrlForm from "./UrlForm"
import Header from "./Header"
import background from "../../static/images/background.png";
import ErrorPage from "./ErrorPage";

interface RootProps {
  rootUrl: string,
  error: boolean
}

const Root = ({rootUrl, error}: RootProps) => {
  return (
    <div className="w-screen h-screen p-2 bg-cover bg-fixed flex flex-col space-y-8" style={{backgroundImage: `url(${background})`}}>
      <Header/>
      {error ? <ErrorPage rootUrl={rootUrl} /> : <UrlForm rootUrl={rootUrl} />}
    </div>
  );
}

export default Root