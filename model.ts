import { addDateFields } from "./dateHelper";

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

export const getFeaturedAndOthers = (events: Event[]) => {
  const withDateFields: Event[] = addDateFields(events);
  const featured = withDateFields.find((e) => e.isFeatured);
  const others = withDateFields
    .filter((e) => !e.isFeatured)
    .sort((a, b) => (b.startDateISO < a.startDateISO ? -1 : 0));
  return { featured, others };
};
