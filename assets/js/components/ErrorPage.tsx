import React from "react";

const ErrorPage = () => {
  return (
    <div className="w-screen h-screen p-52 bg-cover bg-fixed flex flex-col">
      <div className="w-full flex items-center justify-between">
        <a className="flex justify-center align-middle text-indigo-400 w-full no-underline hover:no-underline font-bold text-2xl lg:text-4xl" href="/">
          That shortened url doesn't seem to exist! Click here to shorten a new url.
        </a>
      </div>
    </div>
  );
}

export default ErrorPage