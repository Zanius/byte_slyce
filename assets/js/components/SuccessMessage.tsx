import React from "react";

interface SuccessMessageProps {
  message: string,
  children: React.ReactNode
}

const SuccessMessage = ({ message, children }: SuccessMessageProps) => {
  // const onClipClick = () => {
  //   var input = document.createElement("input");
  //   input.value = shortUrl;
  //   document.body.appendChild(input);
  //   input.select();
  //   document.execCommand("copy");
  //   document.body.removeChild(input);
  //   alert(shortUrl + " copied to clipboard!");
  // }
  
  return (
    <div className="success bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative">
      <span className="block sm:inline">{message}</span>
      {children}
      {/* <svg onClick={onClipClick} className="h-8 w-8 text-green-500 inline"  width="24" height="24" viewBox="0 0 24 24" strokeWidth="2" stroke="currentColor" fill="none" strokeLinecap="round" strokeLinejoin="round">  <path stroke="none" d="M0 0h24v24H0z"/>  <path d="M9 5H7a2 2 0 0 0 -2 2v12a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2V7a2 2 0 0 0 -2 -2h-2" />  <rect x="9" y="3" width="6" height="4" rx="2" /></svg> */}
    </div>
  );
}

export default SuccessMessage