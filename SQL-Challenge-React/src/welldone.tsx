import { Button, Heading, Loading } from "@carbon/react";
import "./App.scss";
import toast, { Toaster } from "react-hot-toast";
import Confetti from "react-confetti-boom";
import Progressindicator from "./progressindicator.tsx";

function Welldone() {
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
        <Progressindicator className="mainboxcenter" index={5} />
        <Heading className="mainboxcenter topheading">Well Done</Heading>
        <p className="mainboxcenter">
          The Celadon Cathedral, of course! We will dispatch the heroes
          immediately!
        </p>

        <p className="mainboxcenter">
          The heroes arrive at the cathedral, tripping the villains' security
          system and alerting them to their presence. The villains scramble to
          their feet, take their marks, and prepare for battle.
        </p>

        <p className="mainboxcenter">
          Evil Her-mes speeds towards the heroes, in her signature bright red
          puffer. Time Warp slows down time, catches up to Evil Her-mes, and
          handcuffs her.
        </p>

        <p className="mainboxcenter">
          As Doomba vacuums centuries-old dust from the floor, Man in the Van
          tries to hack into the heroes' comms from his van, which is strangely
          inside. Doomba delivers an EMP blast, disabling his equipment, and
          trapping him in his van. He knocks on the door for a while but soon
          gives up.
        </p>

        <p className="mainboxcenter">
          Freeze Tag runs towards the heroes and tries to tag them. Pyra fires
          off a burst of flame straight towards Freeze Tag. Freeze Tag's ice
          melts, and he is left standing in a lukewarm puddle, his powers
          cancelled out.
        </p>

        <p className="mainboxcenter">
          Hellakinetic grabs a chair from rows of chairs in the cathedral and
          telekinetically flings it at an astonishing speed towards Prop. Prop
          morphs into the chair and sends it flying back towards Hellakinetic.
          The chair crashes into Hellakinetic, sending him flying into a wall
          and knocking him unconscious.
        </p>

        <p className="mainboxcenter">
          The victorious heroes bring the defeated villains to the time out
          corner to stay and think about what they’ve done before searching for
          the bags of stolen money. They find it in the crypt. The heroes bring
          it back to the bank, and the bank workers are overjoyed. They thank
          the heroes profusely. The heroes thank them, and take their leave.
        </p>

        <p className="mainboxcenter">
          Congratulations, you’ve solved the mystery! Go and let Leanna or
          Serhat know so they can tell you what to do next.
        </p>
      </div>
      <Confetti
        mode="fall"
        particleCount={80}
        shapeSize={15}
        fadeOutHeight={1}
        colors={["#0f62fe", "#8a3ffc", "#d02670", "#da1e28"]}
      />
    </>
  );
}

export default Welldone;
