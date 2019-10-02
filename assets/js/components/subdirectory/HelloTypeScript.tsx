import * as React from "react";

const HelloTypeScript: React.FC<{name: string}> = ({name}) => {
  const [count, setCount] = React.useState(0)

  return (
    <div onClick={() => setCount(count + 1)}>
      Hello {name}, {count}
    </div>
 )
}

export default HelloTypeScript
