import { Event } from "./model";

const locale = "en-US";
const localeOptions = {
  hour: "2-digit",
  minute: "numeric",
} as const;

export const addDateFields = (eventsToExtend: Event[]) => {
  return eventsToExtend.map((event) => {
    const startDate = new Date(event.startDateISO);
    const endDate = new Date(event.endDateISO);
    if (Number.isNaN(startDate.getDate())) {
      return event;
    }
    return {
      ...event,
      month: startDate.toLocaleString(locale, { month: "short" }),
      day: startDate.getDate(),
      hours: `${startDate.toLocaleString(
        locale,
        localeOptions,
      )} - ${endDate.toLocaleString(locale, {
        timeZoneName: "short",
        ...localeOptions,
      })}`,
      inThePast: endDate < new Date(),
    };
  });
};
