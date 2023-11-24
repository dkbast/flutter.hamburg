import React from "react";
import styles from "./EventBox.module.css";
import locationIcon from "./location.svg";
import externalLinkIcon from "./external.svg";

export const EventBox: React.FC<unknown> = () => {
  return (
    <div className={`${styles.eventBox} eventbox`}>
      <div className={styles.topRow}>
        <section>
          <h3>Hamburg Meet-Up</h3>
          <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
            eiusmod tempor incididunt ut labore et dolore magna.
          </p>
          <div className={styles.status}>Free</div>
        </section>
        <figure className={styles.calendarIcon}>
          <div className={styles.month}>NOV</div>
          <div className={styles.day}>20</div>
        </figure>
      </div>
      <a href="/" className={styles.location}>
        <img src={locationIcon} alt="location"></img>
        Netlight Consulting GmbH, Große Bleichen 23-27
        <img src={externalLinkIcon} alt="external link"></img>
      </a>
    </div>
  );
};
