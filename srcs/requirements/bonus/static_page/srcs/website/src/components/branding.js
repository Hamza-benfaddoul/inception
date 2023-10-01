import React from 'react'

import PropTypes from 'prop-types'

import './branding.css'

const Branding = (props) => {
  return (
    <div className="branding-branding">
      <span className="branding-text">{props.text}</span>
      <svg viewBox="0 0 1024 1024" className="branding-icon">
        <path d="M128 128h768v768h-768z"></path>
      </svg>
      <span className="branding-text1">{props.text1}</span>
    </div>
  )
}

Branding.defaultProps = {
  text: 'Remarkable',
  text1: 'Remarkable',
}

Branding.propTypes = {
  text: PropTypes.string,
  text1: PropTypes.string,
}

export default Branding
