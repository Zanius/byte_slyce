import axios, { AxiosError, AxiosRequestConfig, AxiosResponse } from "axios";
import React, { useState, useEffect, FormEvent, ChangeEvent, KeyboardEvent } from "react";
import SuccessMessage from "./SuccessMessage"
import ErrorMessage from "./ErrorMessage"
import Clipboard from "./Clipboard"
import SubmitButton from "./SubmitButton";
import { LongUrl } from "../types"
import { validateUrl } from "../Validation";
import { formatServerErrors, submit } from "../ApiSubmission";

const UrlForm = () => {
  const [longUrl, setLongUrl] = useState("");
  const [successMessage, setSuccessMessage] = useState("");
  const [errorMessage, setErrorMessage] = useState("");
  const [shortUrl, setShortUrl] = useState("");

  const submitUrl = async () => {
    const rootUrl = window.location.host + "/";
    setShortUrl("");
    setSuccessMessage("");
    if (errorMessage.length > 0 || !longUrl || longUrl === "") {
      return null;
    }

    submit(longUrl)
      .then(function (response: AxiosResponse) {
        const urlResponse: LongUrl = response.data.data;
        const shortenedUrl = rootUrl + urlResponse.url_slug;
        setShortUrl(shortenedUrl)
        setSuccessMessage(`Your new url is: ${shortenedUrl}`);
      })
      .catch(function (error: AxiosError) {
        setErrorMessage(formatServerErrors(error));
      });
  }

  const handleUrlInput = (urlString: string) => {
    setErrorMessage(validateUrl(urlString))
    setLongUrl(urlString);
  }

  const handleKeyPress = (e: KeyboardEvent) => {
    e.preventDefault
    if (e.code === "Enter") {
      setErrorMessage(validateUrl(longUrl))
      submitUrl()
    }
  }

  return (
    <div className="bg-gray-900 opacity-75 mx-auto w-1/2 shadow-lg rounded-lg px-8 pt-6 pb-8 mb-4 space-y-2">
      <label className="block text-blue-300 py-2 font-bold mb-2">
        You're on your way to a fun filled short url experience!
        <input
          className="shadow appearance-none border rounded w-full p-3 text-gray-700 leading-tight focus:ring transform transition hover:scale-105 duration-300 ease-in-out"
          type="text"
          placeholder="https://www.yoursuperhugeurlthatiswaytoolong.com"
          onChange={e => handleUrlInput(e.target.value)}
          onKeyPress={handleKeyPress}
        />
      </label>


      {successMessage ? <SuccessMessage message={successMessage}><Clipboard url={shortUrl} /></SuccessMessage> : null}
      {errorMessage ? <ErrorMessage message={errorMessage} /> : null}

      <SubmitButton clickHandler={submitUrl} disabled={errorMessage.length > 0} />
    </div>
  )
}

export default UrlForm
