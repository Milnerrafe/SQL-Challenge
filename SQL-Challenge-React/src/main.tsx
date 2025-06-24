import { BrowserRouter, Routes, Route } from "react-router";
import { createRoot } from "react-dom/client";
import "./index.scss";
import Firststart from "./firststart.tsx";
import Mainview from "./mainview.tsx";

createRoot(document.getElementById("root")!).render(
  <BrowserRouter>
    <Routes>
      <Route path="/" element={<Firststart />} />
      <Route path="/welcome" element={<Mainview />} />
    </Routes>
  </BrowserRouter>,
);
