import React from "react";

interface SuccessMessageProps {
  message: string,
  children: React.ReactNode
}

const SuccessMessage = ({ message, children }: SuccessMessageProps) => {
  return (
    <div className="success bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative">
      <span className="inline">{message}</span>
      {children}
    </div>
  );
}

export default SuccessMessage