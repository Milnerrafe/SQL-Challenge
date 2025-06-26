import { BrowserRouter, Routes, Route } from "react-router-dom";
import "./index.scss";
import Firststart from "./firststart";
import Questionpage from "./questionpage";
import Welldone from "./welldone";
import Server from "./server";

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/setup" element={<Firststart />} />
        <Route path="/" element={<Questionpage />} />
        <Route path="/welldone" element={<Welldone />} />
        <Route path="/server" element={<Server />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
