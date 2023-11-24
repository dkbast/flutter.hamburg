import React from "react";
import { Button } from "antd";
import { ReactComponent as Logo } from "./logo.svg";
import styles from "./Header.module.css";
import { ReactComponent as BurgerMenu } from "./burgerMenu.svg";

export const Header: React.FC<unknown> = () => {
  return (
    <div className={styles.wrapper}>
      <header>
        <a href="/">
          <Logo />
        </a>
        <section className={styles.rightColumn}>
          <div className={`${styles.events} headerEvents`}>
            <div className={styles.selected}>Next Event</div>
            <div>Upcoming events</div>
          </div>
          <Button type="primary">Jobs</Button>
          <BurgerMenu className={`${styles.burgerMenu} burgerMenu`} />
        </section>
      </header>
    </div>
  );
};
