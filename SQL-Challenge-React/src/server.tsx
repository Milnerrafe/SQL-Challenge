import React, { useState } from "react";
import "./App.scss";
import { Button, Heading, TextInput } from "@carbon/react";
import Cookies from "js-cookie";
import { useNavigate } from "react-router";
import toast, { Toaster } from "react-hot-toast";
import Progressindicator from "./progressindicator.tsx";

function Server() {
  const [pyhost, setPyhost] = useState("");
  const navigate = useNavigate();

  const handleSubmit = () => {
    fetch(`${pyhost}/isserver`, {
      method: "GET",
    })
      .then((response) => response.text())
      .then((textResponse) => {
        const responseVar = textResponse;
        if (responseVar === "serverup") {
          Cookies.set("pyhost", pyhost, { expires: 7 });
          navigate("/");
        } else {
          toast.error("There has been an error. The Sever address is wrong.");
        }
      })
      .catch((error) => {
        console.error(error);
        toast.error("There has been an error. The Sever address is wrong.");
      });
  };

  return (
    <>
      <style>
        {
          "#main {display: grid;grid-template-columns: 1fr 3fr 1fr;}.mainboxcenter {grid-column: 2 / 3;margin-bottom: 20px;}.progress {margin-bottom: 60px; margin-top: 20px;}.boxbottombuttons {margin-right: 20px;}.topheading {margin-top: 50px;}"
        }
      </style>
      <Toaster
        position="bottom-right"
        toastOptions={{
          error: {
            iconTheme: {
              primary: "red",
              secondary: "white",
            },
          },
        }}
      />
      <div id="main">
        <Progressindicator className="mainboxcenter progress" index={0} />
        <Heading className="mainboxcenter topheading">Welcome</Heading>
        <p className="mainboxcenter">
          Please enter the web address of your Python server below, in the
          format: http://your-address (do not include a trailing / at the end).
        </p>

        <TextInput
          type="text"
          required
          id="pyhost"
          labelText="Python Server Web Address"
          className="mainboxcenter"
          value={pyhost}
          onChange={(e) => setPyhost(e.target.value)}
        />

        <div className="mainboxcenter">
          <Button className="boxbottombuttons" onClick={handleSubmit}>
            Connect To Server
          </Button>
        </div>
      </div>
    </>
  );
}

export default Server;
