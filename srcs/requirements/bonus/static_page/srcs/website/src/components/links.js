import React from 'react'

import PropTypes from 'prop-types'

import './links.css'

const Links = (props) => {
  return (
    <nav className="links-links">
      <button className="links-button button">
        <span>{props.text}</span>
      </button>
      <button className="links-button1 button">
        <span>{props.text1}</span>
      </button>
      <button className="links-button2 button">{props.button}</button>
    </nav>
  )
}

Links.defaultProps = {
  button: 'Menu',
  text: 'Our offers',
  text1: 'Get a fast quote',
}

Links.propTypes = {
  button: PropTypes.string,
  text: PropTypes.string,
  text1: PropTypes.string,
}

export default Links
