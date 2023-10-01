import React from 'react'

import PropTypes from 'prop-types'

import './card.css'

const Card = (props) => {
  return (
    <div className="card-card card">
      <div className="card-header">
        <img alt="image" src={props.Icon} className="card-icon" />
        <h3 className="card-heading">{props.Title}</h3>
      </div>
      <p className="card-text">{props.Description}</p>
    </div>
  )
}

Card.defaultProps = {
  Icon: '/group%201643.svg',
  Title: 'High-impact business services',
  Description:
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
}

Card.propTypes = {
  Icon: PropTypes.string,
  Title: PropTypes.string,
  Description: PropTypes.string,
}

export default Card
