import axios, { AxiosError, AxiosPromise, AxiosRequestConfig, AxiosResponse } from "axios";

export function formatServerErrors(error: AxiosError) {
  let errors = error.response?.data.errors;

  if (errors) {
    let message = ""
    for (var key in errors) {
      message += `${key}: `
      message += errors[key].join(', ')
    }
    return message

  } else {
    return "Invalid url"
  }
}

export async function submit(url: string): Promise<AxiosResponse> {
  const data = JSON.stringify({ "long_url": { url } });

  const config: AxiosRequestConfig = {
    method: 'post',
    url: '/api/long_urls',
    headers: {
      'Content-Type': 'application/json'
    },
    data: data
  };

  return await axios(config);
}
