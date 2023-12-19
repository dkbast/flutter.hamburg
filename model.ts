interface Host {
  name: string;
  role: string;
  image: string;
}

export interface Event {
  title: string;
  summary: string;
  description: string[];
  isFeatured: boolean;
  status: string;
  location: string;
  link: string;
  startDateISO: string;
  endDateISO: string;
  hosts: Host[];
  tags: string[];
}
