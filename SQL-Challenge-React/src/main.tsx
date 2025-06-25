import { BrowserRouter, Routes, Route } from "react-router";
import { createRoot } from "react-dom/client";
import "./index.scss";
import Firststart from "./firststart.tsx";
import Questionpage from "./questionpage.tsx";

createRoot(document.getElementById("root")!).render(
  <BrowserRouter>
    <Routes>
      <Route path="/" element={<Firststart />} />
      <Route path="/question" element={<Questionpage />} />
    </Routes>
  </BrowserRouter>,
);
