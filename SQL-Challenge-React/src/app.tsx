import { useEffect, useState } from "react";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import { Loading } from "@carbon/react";
import Cookies from "js-cookie";
import "./index.scss";
import Firststart from "./firststart";
import Questionpage from "./questionpage";
import Welldone from "./welldone";
import Server from "./server";

function App() {
  const [serverUp, setServerUp] = useState<null | boolean>(null);

  useEffect(() => {
    const pyhost = Cookies.get("pyhost");

    if (!pyhost) {
      setServerUp(false);
      return;
    }

    fetch(`${pyhost}/isserver`)
      .then((res) => res.text())
      .then((text) => {
        setServerUp(text === "serverUp");
      })
      .catch(() => {
        setServerUp(false);
      });
  }, []);

  if (serverUp === null) {
    return (
      <>
        <style>{".CenterLoad{display:grid;place-items:center}"}</style>
        <Loading active className="centerload" description="Loading" />
      </>
    );
  }

  return (
    <BrowserRouter>
      <Routes>
        {serverUp ? (
          <>
            <Route path="/setup" element={<Firststart />} />
            <Route path="/" element={<Questionpage />} />
            <Route path="/welldone" element={<Welldone />} />
          </>
        ) : (
          <Route path="*" element={<Server />} />
        )}
      </Routes>
    </BrowserRouter>
  );
}

export default App;
