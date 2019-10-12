import React, {Component, useState} from 'react'


class HelloWorld extends Component {
  state = {
    count: 0,
  }

  onClick = () => {
    this.setState(prevState => ({
      count: prevState.count + 1,
    }))
  }

  render() {
    const {name} = this.props
    const {count} = this.state

    return (
      <div onClick={this.onClick}>
        Hello {name}, {count} 💪
      </div>
    )
  }
}

export default HelloWorld
