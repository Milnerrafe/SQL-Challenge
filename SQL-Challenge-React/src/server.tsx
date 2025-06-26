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

  const handleLink = () => {
    window.open("https://github.com/Milnerrafe/SQL-Challenge", "_blank");
  };

  const handleSubmit = () => {
    fetch(`${pyhost}/api`, {
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
          format: http://your-address:8000 (do not include a trailing / at the
          end).
        </p>
        <p className="mainboxcenter">
          Due to web security policies, please ensure that you are at the HTTP
          version of this website.
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
          <Button
            className="boxbottombuttons"
            kind="tertiary"
            onClick={handleLink}
          >
            Guide and Github
          </Button>
        </div>
      </div>
    </>
  );
}

export default Server;
