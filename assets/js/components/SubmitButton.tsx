import React from "react";
import UrlForm from "./UrlForm"
import Header from "./Header"
import background from "../../static/images/background.png";

interface ButtonProps {
  clickHandler: () => void,
  disabled: boolean
}

const buttonClassNames = `
  submit-button
  bg-gradient-to-r from-purple-800 to-green-500 
  hover:from-pink-500 hover:to-green-500 
  text-white font-bold py-2 px-4 
  rounded focus:ring 
  transform transition hover:scale-105 duration-300 ease-in-out
`

const buttonStyle = (disabled: boolean) => {
  if (disabled) {
    return {
      opacity: 50
    }
  }
}
// disabled:opacity-50 
const SubmitButton = ({ clickHandler, disabled }: ButtonProps) => {
  return (
    <button
      className={`${buttonClassNames}`}
      style={buttonStyle(disabled)}
      type="button"
      disabled={disabled}
      onClick={clickHandler}
    >
      Slyce!
    </button>
  );
}

export default SubmitButton