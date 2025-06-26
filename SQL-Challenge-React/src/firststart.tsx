import React, { useState } from "react";
import "./App.scss";
import { Button, Heading, TextInput } from "@carbon/react";
import Cookies from "js-cookie";
import { useNavigate } from "react-router";
import toast, { Toaster } from "react-hot-toast";
import Progressindicator from "./progressindicator.tsx";

function Firststart() {
  const [dbhost, setDbhost] = useState("");
  const [dbusername, setDbusername] = useState("");
  const [dbpassword, setDbpassword] = useState("");
  const navigate = useNavigate();

  const handleSubmit = () => {
    fetch("http://10.253.204.3:8000/api/setup", {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        host: dbhost,
        username: dbusername,
        password: dbpassword,
      }),
    })
      .then((response) => response.text())
      .then((textResponse) => {
        const responseVar = textResponse;
        if (responseVar === "success") {
          Cookies.set("setupdone", "True", { expires: 7 });
          navigate("/");
        } else {
          toast.error(
            "There has been an error. Your credentials may be wrong, please try again",
          );
        }
      })
      .catch((error) => {
        console.error(error);
        toast.error(
          "There has been an error. Your credentials may be wrong, please try again",
        );
      });
  };

  return (
    <>
      <style>
        {
          "#main {display: grid;grid-template-columns: 1fr 3fr 1fr;}.progress {margin-bottom: 60px; margin-top: 20px;}.mainboxcenter {grid-column: 2 / 3;margin-bottom: 20px;}.boxbottombuttons {margin-right: 20px;}.topheading {margin-top: 50px;}"
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
        <Progressindicator className="mainboxcenter" index={0} />
        <Heading className="mainboxcenter topheading">Welcome</Heading>
        <p className="mainboxcenter">
          Hello SQL Hero, Before we get started, we need to connect this app to
          your database so we can validate your answers. Please enter your
          database credentials below.
        </p>

        <TextInput
          type="text"
          required
          id="dbhost"
          labelText="DB - Host ip"
          className="mainboxcenter"
          value={dbhost}
          onChange={(e) => setDbhost(e.target.value)}
        />

        <TextInput
          type="text"
          required
          id="dbusername"
          labelText="DB - Username"
          className="mainboxcenter"
          value={dbusername}
          onChange={(e) => setDbusername(e.target.value)}
        />
        <TextInput
          type="password"
          required
          id="dbpassword"
          labelText="DB - Password"
          className="mainboxcenter"
          value={dbpassword}
          onChange={(e) => setDbpassword(e.target.value)}
        />

        <div className="mainboxcenter">
          <Button className="boxbottombuttons" onClick={handleSubmit}>
            Lets Get Started
          </Button>
        </div>
      </div>
    </>
  );
}

export default Firststart;
