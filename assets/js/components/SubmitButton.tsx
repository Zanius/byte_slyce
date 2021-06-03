import React from "react";

interface ButtonProps {
  clickHandler: () => void,
  disabled: boolean
}

const classNames = (disabled: boolean) : string => {
  return `
    submit-button
    bg-gradient-to-r from-purple-800 to-green-500 
    hover:from-pink-500 hover:to-green-500 
    font-bold py-2 px-4 
    rounded focus:ring text-white
    ${disabledClasses(disabled)}
  `
}

const disabledClasses = (disabled: boolean) : string => {
  if (disabled) {
    return "cursor-not-allowed opacity-80"
  } else {
    return "transform transition hover:scale-105 duration-300 ease-in-out"
  }
}

const SubmitButton = ({ clickHandler, disabled }: ButtonProps) => {
  return (
    <button
      className={classNames(disabled)}
      type="button"
      disabled={disabled}
      onClick={clickHandler}
    >
      Slyce!
    </button>
  );
}

export default SubmitButton