import React, {useState} from 'react'

function HelloWorld2(props) {
  const {name} = props
  const [count, setCount] = useState(0)

  return (
    <div onClick={() => setCount(count + 1)}>
      Hello {name}, {count}
    </div>
   ) 
}

export default HelloWorld2
