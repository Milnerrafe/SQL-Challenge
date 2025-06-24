import "./App.scss";
import { Button, Heading, TextInput } from "@carbon/react";

function Firststart() {
  return (
    <>
      <style>
        {
          "#main {display: grid;grid-template-columns: 1fr 3fr 1fr;}.mainboxcenter {grid-column: 2 / 3;margin-bottom: 20px;}.boxbottombuttons {margin-right: 20px;}.topheading {margin-top: 50px;}"
        }
      </style>
      <div id="main">
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
        />

        <TextInput
          type="username"
          required
          id="dbusername"
          labelText="DB - Username"
          className="mainboxcenter"
        />
        <TextInput
          type="password"
          required
          id="dbpassword"
          labelText="DB - Password"
          className="mainboxcenter"
        />

        <div className="mainboxcenter">
          <Button className="boxbottombuttons">Lets Get Started</Button>
        </div>
      </div>
    </>
  );
}

export default Firststart;
