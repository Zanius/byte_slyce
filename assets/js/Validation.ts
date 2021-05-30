const validUrl = new RegExp(
  /^(h$|ht$|htt$|http$|https?$|https?:$|https?:\/$|https?:\/\/)/
);

export const validateUrl = (url: string) : string => {
  if (!validUrl.test(url) || url === "") {
    return "Url must begin with http:// or https://"
  } else {
    return "";
  }
}
