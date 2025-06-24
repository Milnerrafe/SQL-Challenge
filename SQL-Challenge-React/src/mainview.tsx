import "./App.scss";
import { Button, Heading, TextInput } from "@carbon/react";

function Mainview({ heading }: { heading: string }) {
  return (
    <>
      <style>
        {
          "#main {display: grid;grid-template-columns: 1fr 3fr 1fr;}.mainboxcenter {grid-column: 2 / 3;margin-bottom: 20px;}.boxbottombuttons {margin-right: 20px;}.topheading {margin-top: 50px;}"
        }
      </style>
      <div id="main">
        <Heading className="mainboxcenter topheading">{heading}</Heading>
        <p className="mainboxcenter">
          You are the manager of all Heroes on the planet, and there’s just been
          an incident! Unfortunately, the world’s government funding has all
          been invested into Funko Pops, and they can’t afford to hire any SQL
          developers.{" "}
        </p>

        <p className="mainboxcenter">
          So, we need you to become one very fast. You will need to learn how to
          effectively navigate an SQL database through a Python or Terminal
          interface to complete this task. Some of the things you might have to
          do using SQL (without us giving everything away) include: - Select
          database - View tables - Filter and sort outputs - Insert data Note
          that we will be using specifically MySQL for this work. It is one of
          the many variants of SQL and other ones might have slightly different
          syntax. So, make sure you specify MySQL during your research.
        </p>

        <p className="mainboxcenter">
          To get started, you will want to review the most recent incident
          logged in the database. You will need to write the right query to
          extract it from the database. For your first challenge, you will need
          to identify the fiendish villains behind this dastardly plot! Find the
          database you need to access and read the descriptions of each table in
          it to figure out where the information you need is stored, and how to
          submit your answers. You will need to do a lot of Googling to crack
          this case, detective! If you are ever truly stuck, ask Leanna or
          Serhat for help and they can point you in the right direction. If you
          use ChatGPT, then the world will explode and you’ll be out of a job,
          so don’t do that. Good luck!
        </p>

        <TextInput
          type="text"
          required
          id="dbhost"
          labelText="DB - Host Ip"
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
          <Button className="boxbottombuttons">Back</Button>
          <Button className="boxbottombuttons">Lets Get Started</Button>
        </div>
      </div>
    </>
  );
}

export default Mainview;
