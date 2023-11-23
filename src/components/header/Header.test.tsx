import React from "react";
import { render, screen } from "@testing-library/react";
import { Header } from "./Header";

test("renders Header", () => {
  render(<Header />);
  expect(screen.getByText(/Next event/i)).toBeInTheDocument();
});
