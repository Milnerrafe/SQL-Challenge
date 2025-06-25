import React, { useEffect, useState, useCallback } from "react";
import { Button, Heading, Loading } from "@carbon/react";
import "./App.scss";
import { useNavigate } from "react-router";
import toast, { Toaster } from "react-hot-toast";

function Questionpage() {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  const navigate = useNavigate();

  const fetchData = useCallback(async () => {
    try {
      const response = await fetch("http://10.253.204.6:8000/api/question");
      const json = await response.json();
      setData(json);
      setLoading(false);
      if (json.setupneeded === "yes") {
        navigate("/setup");
      }
      if (json.welldone === "yes") {
        navigate("/welldone");
      }
    } catch (error) {
      console.error("Error fetching JSON:", error);
      setLoading(false);
      toast.error(
        "There Has been and error, the server may not be working; Please try again.",
      );
    }
  }, [navigate]);

  useEffect(() => {
    fetchData();
  }, [fetchData]);

  const handleSubmit = () => {
    console.log("1");
    fetch("http://10.253.204.6:8000/api/check", {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        qnumber: data.questionnumber,
      }),
    })
      .then((response) => response.text())
      .then((textResponse) => {
        console.log("2");
        const responseVar = textResponse;
        if (responseVar === "yes") {
          toast.success(data.answersresponse.iscorrect);
          setTimeout(() => {
            fetchData();
          }, 2000);
        }
        if (responseVar === "red") {
          toast.error(data.answersresponse.redherring);
        }
        if (responseVar === "no") {
          toast.error("Your answer is incorrect. Please try again.");
        }
      })
      .catch((error) => {
        console.error(error);
        toast.error(
          "There has been an error. Your credentials may be wrong, please try again",
        );
      });
  };

  if (loading) {
    return (
      <>
        <style>
          {
            ".centerload{position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);z-index:1000}"
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
