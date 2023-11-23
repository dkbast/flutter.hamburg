import React from "react";
import { Button } from "antd";
import { ReactComponent as Logo } from "./logo.svg";
import "./Header.css";

export const Header: React.FC<unknown> = () => {
  return (
    <div className="wrapper">
      <header>
        <Logo />
        <div className="rightColumn">
          <div className="events">
            <div className="selected">Next event</div>
            <div>Upcoming events</div>
          </div>
          <Button type="primary">Jobs</Button>
        </div>
      </header>
    </div>
  );
};
