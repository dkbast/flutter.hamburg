import React from "react";
import styles from "./Main.module.css";
import { EventBox } from "../eventBox/EventBox";

export const Main: React.FC<unknown> = () => {
  return (
    <main>
      <section className={styles.topSection}>
        <h1 className={styles.header1}>Flutter</h1>
        <h2 className={styles.header2}>in Hamburg</h2>
        <p className={styles.desc}>
          Hamburg has one of the largest and most active Flutter communities in
          Germany, we have a big meetup every 2-3 months, a monthly (mostly)
          german speaking "Stammtisch" and a weekly Flutter lunch.
        </p>
      </section>
      <EventBox />
      <div className={styles.gradient} />
    </main>
  );
};
