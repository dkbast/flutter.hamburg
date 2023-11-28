import React from "react";
import styles from "./Main.module.css";
import { EventBox } from "../eventBox/EventBox";

export const Main: React.FC<unknown> = () => {
  return (
    <main>
      <section className={`${styles.topSection} topSection`}>
        <EventBox />
        <h1 className={styles.header1}>Flutter</h1>
        <h2 className={styles.header2}>in Hamburg</h2>
        <p className={styles.desc}>
          Hamburg has one of the largest and most active Flutter communities in
          Germany, we have a big meetup every 2-3 months, a monthly (mostly)
          german speaking "Stammtisch" and a weekly Flutter lunch.
        </p>
        <div className={`${styles.gradient} gradient`} />
      </section>
      <section className={`${styles.contentSection} contentSection`}>
        <div className={styles.leftColumn}>
          <h4>ABOUT THE EVENT</h4>
          <h3>Flutter Hamburg 2023/12 - Glögg Special</h3>
          <p>
            Our goal is to connect people who love to build great software with
            Flutter/Dart, people who want to exchange about their learnings and
            failures, about best practices and about strategies to adapt
            disciplines like Domain Driven Design, Service Oriented Architecture
            and more.Get togethers, talks, hacking - everything is possible ;-)
          </p>
          <p>
            Flutter + Glögg has proven to be a wonderful combination and we are
            able to host another event like this!
          </p>
          <p>
            We have two amazing speakers for this event: Ole from Netlight and
            Sylvia who is a Flutter Google Developer Expert visiting us from
            Cape Town, South Africa! Don’t miss it!
          </p>
        </div>
        <div className={`${styles.rightColumn} rightColumn`}>
          <h3>Tags</h3>
          <p>
            Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
            nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
            erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
            et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
            Lorem ipsum dolor sit amet.
          </p>
        </div>
      </section>
    </main>
  );
};
