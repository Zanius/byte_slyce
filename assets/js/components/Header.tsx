import React from "react";

const Header = () => {
  return (
    <a className="flex justify-center align-middle 
      text-indigo-400 w-full no-underline hover:no-underline f
      ont-bold text-2xl lg:text-4xl" href="/">
      <span className="leading-tight">Byte</span>
      <span className="leading-tight bg-clip-text 
        text-transparent bg-gradient-to-r 
        from-green-400 via-pink-500 
        to-purple-500">
        Slyce
      </span>
    </a>
  );
}

export default Header