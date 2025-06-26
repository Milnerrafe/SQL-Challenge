import { ProgressIndicator, ProgressStep } from "@carbon/react";
import "./App.scss";

type ProgressindicatorProps = {
  index: number;
  className?: string;
};

function Progressindicator({ index, className }: ProgressindicatorProps) {
  if (index === 0) {
    return (
      <div className={className}>
        <ProgressIndicator currentIndex={index}>
          <ProgressStep current label="Setting Things Up" />
          <ProgressStep label="Task 1" />
          <ProgressStep label="Task 2" />
          <ProgressStep label="Task 3" />
          <ProgressStep label="Task 4" />
          <ProgressStep label="Challenge complete" />
        </ProgressIndicator>
      </div>
    );
  }
  if (index === 1) {
    return (
      <div className={className}>
        <ProgressIndicator currentIndex={index}>
          <ProgressStep complete label="Setting Things Up" />
          <ProgressStep
            current
            label="Task 1"
            secondaryLabel="Finding the Villains"
          />
          <ProgressStep label="Task 2" />
          <ProgressStep label="Task 3" />
          <ProgressStep label="Task 4" />
          <ProgressStep label="Challenge complete" />
        </ProgressIndicator>
      </div>
    );
  }
  if (index === 2) {
    return (
      <div className={className}>
        <ProgressIndicator currentIndex={index}>
          <ProgressStep complete label="Setting Things Up" />
          <ProgressStep
            complete
            label="Task 1"
            secondaryLabel="Finding the Villains"
          />
          <ProgressStep
            current
            label="Task 2"
            secondaryLabel="Choose your heroes"
          />
          <ProgressStep label="Task 3" />
          <ProgressStep label="Task 4" />
          <ProgressStep label="Challenge complete" />
        </ProgressIndicator>
      </div>
    );
  }
  if (index === 3) {
    return (
      <div className={className}>
        <ProgressIndicator currentIndex={index}>
          <ProgressStep complete label="Setting Things Up" />
          <ProgressStep
            complete
            label="Task 1"
            secondaryLabel="Finding the Villains"
          />
          <ProgressStep
            complete
            label="Task 2"
            secondaryLabel="Choose your heroes"
          />
          <ProgressStep
            current
            label="Task 3"
            secondaryLabel="Where's evil hiding"
          />
          <ProgressStep label="Task 4" />
          <ProgressStep label="Challenge complete" />
        </ProgressIndicator>
      </div>
    );
  }
  if (index === 4) {
    return (
      <div className={className}>
        <ProgressIndicator currentIndex={index}>
          <ProgressStep complete label="Setting Things Up" />
          <ProgressStep
            complete
            label="Task 1"
            secondaryLabel="Finding the Villains"
          />
          <ProgressStep
            complete
            label="Task 2"
            secondaryLabel="Choose your heroes"
          />
          <ProgressStep
            complete
            label="Task 3"
            secondaryLabel="Where's evil hiding"
          />
          <ProgressStep
            current
            label="Task 4"
            secondaryLabel="Send in the team"
          />
          <ProgressStep label="Challenge complete" />
        </ProgressIndicator>
      </div>
    );
  }
  if (index === 5) {
    return (
      <div className={className}>
        <ProgressIndicator currentIndex={index}>
          <ProgressStep complete label="Setting Things Up" />
          <ProgressStep
            complete
            label="Task 1"
            secondaryLabel="Finding the Villains"
          />
          <ProgressStep
            complete
            label="Task 2"
            secondaryLabel="Choose your heroes"
          />
          <ProgressStep
            complete
            label="Task 3"
            secondaryLabel="Where's evil hiding"
          />
          <ProgressStep
            complete
            label="Task 4"
            secondaryLabel="Send in the team"
          />
          <ProgressStep
            complete
            label="Challenge complete"
            secondaryLabel="You did it"
          />
        </ProgressIndicator>
      </div>
    );
  }

  return null;
}

export default Progressindicator;
