import React from "react";
import styles from "./EventBox.module.css";

export const EventBox: React.FC<unknown> = () => {
  return (
    <div className={styles.eventBox}>
      <section>
        <h3>Hamburg Meet-Up</h3>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
          eiusmod tempor incididunt ut labore et dolore magna aliqua.
        </p>
      </section>
      <div className={styles.calendarIcon}>
        <div className={styles.month}>NOV</div>
        <div className={styles.day}>20</div>
      </div>
    </div>
  );
};
