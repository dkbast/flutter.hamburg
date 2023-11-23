import React from "react";
import { Button } from "antd";
import { ReactComponent as Logo } from "./logo.svg";
import styles from "./Header.module.css";

export const Header: React.FC<unknown> = () => {
  return (
    <div className={styles.wrapper}>
      <header>
        <Logo />
        <section className={styles.rightColumn}>
          <div className={styles.events}>
            <div className={styles.selected}>Next event</div>
            <div>Upcoming events</div>
          </div>
          <Button type="primary">Jobs</Button>
        </section>
      </header>
    </div>
  );
};
