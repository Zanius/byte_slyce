export interface LongUrl {
  id: number;
  url: string;
  url_slug: string;
}

export interface ServerResponse {
  data: LongUrl
}
