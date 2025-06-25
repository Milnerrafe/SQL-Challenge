import React, { useEffect, useState } from "react";
import { Button, Heading } from "@carbon/react";
import "./App.scss";
import checkanswer from "./check-answer.ts";

function Questionpage() {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);

  const handleSubmit = () => {
    checkanswer();
  };

  useEffect(() => {
    fetch("http://10.253.204.6:8000/api/question")
      .then((response) => response.json())
      .then((json) => {
        setData(json);
        setLoading(false);
      })
      .catch((error) => {
        console.error("Error fetching JSON:", error);
        setLoading(false);
      });
  }, []);

  if (loading) {
    return <div>Loading...</div>;
  }

  return (
    <>
      <style>
        {
          "#main {display: grid;grid-template-columns: 1fr 3fr 1fr;}.mainboxcenter {grid-column: 2 / 3;margin-bottom: 20px;}.boxbottombuttons {margin-right: 20px;}.topheading {margin-top: 50px;}"
        }
      </style>
      <div id="main">
        <Heading className="mainboxcenter topheading">
          {data.question.title}
        </Heading>

        {data.question.p1 !== "null" && (
          <p className="mainboxcenter">{data.question.p1}</p>
        )}

        {data.question.p2 !== "null" && (
          <p className="mainboxcenter">{data.question.p2}</p>
        )}

        {data.question.p3 !== "null" && (
          <p className="mainboxcenter">{data.question.p3}</p>
        )}

        {data.question.p4 !== "null" && (
          <p className="mainboxcenter">{data.question.p4}</p>
        )}

        <div className="mainboxcenter">
          <Button className="boxbottombuttons" onClick={handleSubmit}>
            {data.question.submitbutton}
          </Button>
        </div>
      </div>
    </>
  );
}

export default Questionpage;
