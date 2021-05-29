import axios, {AxiosError, AxiosRequestConfig, AxiosResponse} from "axios";
import React, { useState } from "react";
import SuccessMessage from "./SuccessMessage"
import ErrorMessage from "./ErrorMessage"
import Clipboard from "./Clipboard"
import { ServerResponse, LongUrl } from "../types"

const UrlForm = () => {
  const rootUrl = window.location.host + "/";
  const [url, setUrl] = useState("");
  const [successMessage, setSuccessMessage] = useState("");
  const [errorMessage, setErrorMessage] = useState("");
  const [urlSlug, setUrlSlug] = useState("");

  const submitUrl = async () => {
    setUrlSlug("");
    setSuccessMessage("");
    if (errorMessage.length > 0 || !url || url === "") {
      return null;
    }

    const data = JSON.stringify({ "long_url": { url } });

    const config: AxiosRequestConfig = {
      method: 'post',
      url: '/api/long_urls',
      headers: {
        'Content-Type': 'application/json'
      },
      data: data
    };

    const response = await axios(config)
      .then(function (response: AxiosResponse) {
        console.log(response)
        const urlResponse : LongUrl = response.data.data;
        console.log(urlResponse)
        setUrlSlug(urlResponse.url_slug)
        setSuccessMessage(`Your new url is: ${urlResponse}`);
        console.log(response);
      })
      .catch(function (error) {
        console.log(error);
        setErrorMessage(error);
      });
  }

  const validUrl = new RegExp(
    /^(h$|ht$|htt$|http$|https?$|https?:$|https?:\/$|https?:\/\/)/
  );

  const validate = (urlString: string) => {
    if (!validUrl.test(urlString)) {
      setErrorMessage("Url must begin with http:// or https://");
    } else {
      setErrorMessage("");
    }
  }

  const handleUrlInput = (urlString: string) => {
    validate(urlString);
    setUrl(urlString);
  }

  return (
    <form onSubmit={submitUrl} className="bg-gray-900 opacity-75 mx-auto w-1/2 shadow-lg rounded-lg px-8 pt-6 pb-8 mb-4">
      <div className="mb-4">
        <label className="block text-blue-300 py-2 font-bold mb-2">
          You're on your way to a fun filled short url experience!
          <input
            className="shadow appearance-none border rounded w-full p-3 text-gray-700 leading-tight focus:ring transform transition hover:scale-105 duration-300 ease-in-out"
            type="text"
            placeholder="https://www.yoursuperhugeurlthatiswaytoolong.com"
            onChange={e => handleUrlInput(e.target.value)}
          />
        </label>
      </div>

      <div className="flex flex-col space-y-1">
        {successMessage ? <SuccessMessage message={successMessage}><Clipboard url={urlSlug}/></SuccessMessage> : null}
        {errorMessage ? <ErrorMessage message={errorMessage} /> : null}
      </div>

      <div className="flex items-center justify-between pt-4">
        <button
          className="disabled:opacity-50 bg-gradient-to-r from-purple-800 to-green-500 hover:from-pink-500 hover:to-green-500 text-white font-bold py-2 px-4 rounded focus:ring transform transition hover:scale-105 duration-300 ease-in-out"
          type="button"
          disabled={errorMessage.length > 0}
          onClick={submitUrl}
        >
          Slyce!
        </button>
      </div>
    </form>
  )
}

export default UrlForm







