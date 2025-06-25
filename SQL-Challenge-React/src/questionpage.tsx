import React, { useEffect, useState } from "react";
import { Button, Heading, Loading } from "@carbon/react";
import "./App.scss";
import checkanswer from "./check-answer.ts";
import { useNavigate } from "react-router";

function Questionpage() {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  const navigate = useNavigate();

  const handleSubmit = () => {
    checkanswer();
  };

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch("http://10.253.204.6:8000/api/question");
        const json = await response.json();
        setData(json);
        setLoading(false);
        if (json.setupneeded === "yes") {
          navigate("/setup");
        }
      } catch (error) {
        console.error("Error fetching JSON:", error);
        setLoading(false);
      }
    };

    fetchData();
  }, [navigate]);

  if (loading) {
    return (
      <>
        <style>
          {
            ".centerload{position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);z-index:1000}"
          }
        </style>
        <Loading active className="centerload" description="Loading" />
      </>
    );
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
